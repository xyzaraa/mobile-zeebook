import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:second_process/app/modules/home/views/profile_view.dart';
import 'package:second_process/app/modules/home/views/review.dart';
import '../controllers/home_controller.dart';
import 'dart:io';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 45.0),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 33,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 230, 230),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: const Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xFFBABABA),
                            ),
                          ),
                          SizedBox(width: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Search Book",
                              style: TextStyle(
                                color: Color(0xFFBABABA),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      height: 75,
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
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "All",
                      style: TextStyle(
                        color: Color(0xFFa6a5a5),
                      ),
                    ),
                    Text("Comedy"),
                    Text("Fantasy"),
                    Text("Romance"),
                    Text("Mystery"),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Best Seller",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Color(0xFFDADADA),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      'assets/kissingbooth.jpg',
                                      width: 150,
                                      height: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Kissing Booth",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const Text(
                                  "Beth Reekles",
                                  style: TextStyle(
                                    color: Color(0xFFDADADA),
                                  ),
                                ),
                                Row(
                                  children: List.generate(5, (index) {
                                    if (index < 5) {
                                      return const Icon(Icons.star,
                                          color: Colors.yellow);
                                    } else {
                                      return const Icon(Icons.star_border,
                                          color: Colors.yellow);
                                    }
                                  }),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/itstartwithus.jpg',
                                  width: 150,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              "It Start With Us",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "Colleen Hoover",
                              style: TextStyle(
                                color: Color(0xFFDADADA),
                              ),
                            ),
                            Row(
                              children: List.generate(4, (index) {
                                if (index < 5) {
                                  return const Icon(Icons.star,
                                      color: Colors.yellow);
                                } else {
                                  return const Icon(Icons.star_border,
                                      color: Colors.yellow);
                                }
                              }),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/invitationonly.jpg',
                                  width: 150,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              "Invitation Only",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "Cecilia Wang",
                              style: TextStyle(
                                color: Color(0xFFDADADA),
                              ),
                            ),
                            Row(
                              children: List.generate(3, (index) {
                                if (index < 5) {
                                  return const Icon(Icons.star,
                                      color: Colors.yellow);
                                } else {
                                  return const Icon(Icons.star_border,
                                      color: Colors.yellow);
                                }
                              }),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),

              // ==============================================================================================================
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "For You",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/itendswithus.jpg',
                              width: 105,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "It Ends With Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Colleen Hoover",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/onepiece.png',
                              width: 105,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "One Piece",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Eiichiro Oda",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            'assets/echoofoldbooks.jpg',
                            width: 105,
                            height: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Text(
                          "Echo of Old Books",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Barbara Davis",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
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
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/psistillloveyou.jpg',
                              width: 105,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "I Still Love You",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Jenny Han",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/aot.jpeg',
                              width: 105,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Attack on Titan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Hajime Isayama",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              'assets/assasination.jpg',
                              width: 105,
                              height: 190,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "Assassination",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Yusei Matsui",
                          style: TextStyle(
                            color: Color(0xFFDADADA),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                Get.to(() => const HomePage());
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
