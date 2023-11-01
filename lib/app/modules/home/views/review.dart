import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/views/home_page.dart';
import 'package:second_process/app/modules/home/views/profile_view.dart';
import '../controllers/home_controller.dart';
import 'button_purchase.dart';

class Review extends GetView<HomeController> {
  const Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
         child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 45.0),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/chevronleft.png'),
                ),
                const Text(
                  "Detail Book",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Image.asset('assets/bookmark.png'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/goblin.jpg',
                          width: 150,
                          height: 210,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "It Ends With Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                        const Text(
                          "Author: Colleen Hoover",
                          style: TextStyle(fontSize: 13),
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < 4) {
                              return const Icon(Icons.star,
                                  color: Colors.orange);
                            } else {
                              return const Icon(Icons.star_border,
                                  color: Colors.orange);
                            }
                          }),
                        ),
                        const SizedBox(height: 1.0),
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Novel"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                minimumSize: const Size(0, 30),
                                backgroundColor: const Color(0xFFDADADA),
                                foregroundColor: const Color(0xFFaba6a6),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Romance"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                minimumSize: const Size(0, 30),
                                backgroundColor: const Color(0xFFDADADA),
                                foregroundColor: const Color(0xFFaba6a6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Synopsis",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Details",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Review",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Author",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "It Ends with Us is a romance novel by Colleen Hoover based on the relationship between her mother and father.\n  \nIt Ends with Us is a book that follows a girl named Lily who has just moved and is ready to start her life after college. Lily then meets a guy named Ryle and she falls for him. As she is developing feelings for Ryle, Atlas, her first love, reappears and challenges the relationship between Lily and Ryle.",
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 300,
            height: 75,
            margin: const EdgeInsets.only(top: 2.0, bottom: 35.0),
            child: ButtonPurchase(
              onPressed: () {
                // Tindakan yang dijalankan saat tombol "Purchase" ditekan
              },
            ),
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
              }
              else if (index == 3) {
                controller.selectedIndex.value = 3;
                Get.to(() => const ProfileView());
              }
              else {
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
