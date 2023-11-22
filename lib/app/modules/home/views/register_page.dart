import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/controllers/auth_controller.dart';
import 'package:second_process/app/modules/home/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (error) {
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        _authController.registerUser(
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // Ubah warna sesuai keinginan Anda
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Register'),
              );
            }),
            SizedBox(
                height:
                    8), // Tambahkan sedikit jarak antara tombol register dan login
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                        Get.off(LoginPage());
                      },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime, // Ubah warna sesuai keinginan Anda
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login'),
              );
            }),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _authController.signInWithGoogle();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Ubah warna sesuai keinginan Anda
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
