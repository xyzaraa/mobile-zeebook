import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:second_process/firebase_options.dart';
import 'package:rxdart/rxdart.dart';
import 'app/routes/app_pages.dart';
// core Flutter primitives
import 'package:flutter/foundation.dart';
// core FlutterFire dependency


// TODO: Add stream controller
final _messageStreamController = BehaviorSubject<RemoteMessage>();

// TODO: Define the background message handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 await Firebase.initializeApp();

 if (kDebugMode) {
   print("Handling a background message: ${message.messageId}");
   print('Message data: ${message.data}');
   print('Message notification: ${message.notification?.title}');
   print('Message notification: ${message.notification?.body}');
 }
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// TODO: Request permission
  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  // TODO: Register with FCM

String? token = await messaging.getToken();

if (kDebugMode) {
  print('Registration Token=$token');
}

  // TODO: Set up foreground message handler
 FirebaseMessaging.onMessage.listen((RemoteMessage message) {
   if (kDebugMode) {
     print('Handling a foreground message: ${message.messageId}');
     print('Message data: ${message.data}');
     print('Message notification: ${message.notification?.title}');
     print('Message notification: ${message.notification?.body}');
   }

   _messageStreamController.sink.add(message);
 });


  // TODO: Set up background message handler
FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  

  runApp(
    GetMaterialApp(
      title: "ZeeMovie",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
