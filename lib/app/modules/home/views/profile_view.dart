import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/controllers/home_controller.dart';
import 'package:second_process/app/modules/home/views/home_page.dart';
import 'package:second_process/app/modules/home/views/review.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:second_process/app/modules/home/controllers/auth_controller.dart';


class UserProfile {
  final String username;
  final String profilePicture;

  UserProfile({required this.username, required this.profilePicture});
}

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 25.0, top: 75.0),
                child: const Text(
                  "Hello, User!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 13.0),
                  child: ClipOval(
                    child: Obx(() {
                      if (controller.image != null) {
                        return Image.file(
                          File(controller.image!.path),
                          width: 135,
                          height: 135,
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.asset(
                          'assets/profile.jpg',
                          width: 135,
                          height: 135,
                          fit: BoxFit.cover,
                        );
                      }
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                ElevatedButton(
                                  child: const Text('Pick From Camera'),
                                  onPressed: () {
                                    controller.captureImage();
                                    Navigator.pop(context);
                                  },
                                ),
                                ElevatedButton(
                                  child: const Text('Pick From Gallery'),
                                  onPressed: () {
                                    controller.pickImage();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 225, 170, 87),
                    ),
                    padding: const EdgeInsets.all(5.5),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
//menu under profile
            ListTile(
              contentPadding: const EdgeInsets.only(left: 45, right: 45),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 225, 170, 87).withOpacity(0.1),
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.pen,
                    color: Color.fromARGB(255, 225, 170, 87),
                  ),
                ),
              ),
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 16, // Ganti sesuai kebutuhan
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18.0,
                  color: Color.fromARGB(255, 179, 176, 172),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top:10, left: 45, right: 45),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 225, 170, 87).withOpacity(0.1),
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.clockRotateLeft,
                    color: Color.fromARGB(255, 225, 170, 87),
                  ),
                ),
              ),
              title: const Text(
                'Your Activity',
                style: TextStyle(
                  fontSize: 16, // Ganti sesuai kebutuhan
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18.0,
                  color: Color.fromARGB(255, 179, 176, 172),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(top: 10, left: 45, right: 45),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 225, 170, 87).withOpacity(0.1),
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.wallet,
                    color: Color.fromARGB(255, 225, 170, 87),
                  ),
                ),
              ),
              title: const Text(
                'Purchased Books',
                style: TextStyle(
                  fontSize: 16, // Ganti sesuai kebutuhan
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18.0,
                  color: Color.fromARGB(255, 179, 176, 172),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),

            ListTile(
              contentPadding: const EdgeInsets.only(top: 10, left: 45, right: 45),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 225, 170, 87).withOpacity(0.1),
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.gear,
                    color: Color.fromARGB(255, 225, 170, 87),
                  ),
                ),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16, // Ganti sesuai kebutuhan
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18.0,
                  color: Color.fromARGB(255, 179, 176, 172),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 18.0,
                  color: Color.fromARGB(255, 179, 176, 172),
                ),
              ),
              onTap: () {
                AuthController().logout(); 
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmark',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: 'Recent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              if (index == 0) {
                controller.selectedIndex.value = 0;
                Get.to(() => HomePage());
              } else if (index == 1) {
                controller.selectedIndex.value = 1;
                Get.to(() => const Review());
              } else if (index == 2) {
                controller.selectedIndex.value = 2;
                Get.to(() => const ProfileView());
              } else if (index == 3) {
                controller.selectedIndex.value = 3;
                Get.to(() => const ProfileView());
              } else {
                controller.onItemTapped(index);
              }
            },
            type: BottomNavigationBarType.fixed,
          );
        },
      ),
    );
  }
}
