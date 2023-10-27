import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:second_process/app/modules/home/controllers/home_controller.dart';
import 'dart:convert';
import 'package:second_process/app/modules/home/views/article_page.dart';
import 'package:second_process/app/modules/home/views/profile_view.dart';
import 'package:second_process/app/modules/home/views/review.dart';

class HomePage extends GetView<HomeController> {
  Future<List<Map<String, dynamic>>> fetchMovies() async {
    final response = await http.get(
        Uri.parse('https://api.gdriveplayer.us/v1/movie/newest?limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> movies = data
          .where((item) => item is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList()
            ..removeLast();

      for (final movie in movies) {
        if (movie['title'] != null && (movie['title'] as String).length > 20) {
          movie['title'] = (movie['title'] as String).substring(0, 15) + '...';
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Map<String, dynamic>>> fetchMoviesDrama() async {
    final response = await http.get(
        Uri.parse('https://api.gdriveplayer.us/v1/drama/newest?limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> movies = data
          .where((item) => item is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList()
            ..removeLast();

      for (final movie in movies) {
        if (movie['title'] != null && (movie['title'] as String).length > 20) {
          movie['title'] = (movie['title'] as String).substring(0, 15) + '...';
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Future<List<Map<String, dynamic>>> fetchMoviesAction() async {
    final response = await http.get(
        Uri.parse('https://api.gdriveplayer.us/v1/movie/search?genre=action&limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> movies = data
          .where((item) => item is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList()
            ..removeLast();

      for (final movie in movies) {
        if (movie['title'] != null && (movie['title'] as String).length > 20) {
          movie['title'] = (movie['title'] as String).substring(0, 15) + '...';
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
  Future<List<Map<String, dynamic>>> fetchMoviesAnimation() async {
    final response = await http.get(
        Uri.parse('https://api.gdriveplayer.us/v1/animes/newest?limit=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Map<String, dynamic>> movies = data
          .where((item) => item is Map<String, dynamic>)
          .cast<Map<String, dynamic>>()
          .toList()
            ..removeLast();

      for (final movie in movies) {
        if (movie['title'] != null && (movie['title'] as String).length > 20) {
          movie['title'] = (movie['title'] as String).substring(0, 15) + '...';
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Icon(
                            Icons.search,
                            color: Color(0xFFBABABA),
                          ),
                        ),
                        SizedBox(width: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Search Movie",
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
                      child: Image.asset(
                        'assets/profile.jpg',
                        width: 135,
                        height: 135,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "New Movies",
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
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> movies =
                      List<Map<String, dynamic>>.from(snapshot.data as Iterable);
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: movies.map((movie) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        movie['poster'] ?? '',
                                        width: 150,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    movie['title'] ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    movie['director'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      int rating = 0;
                                      try {
                                        var ratingString = movie['rating'];
                                        if (ratingString != null) {
                                          rating = (double.parse(ratingString)).round();
                                        }
                                      } catch (e) {
                                        print('Error parsing rating: $e');
                                      }
                                      if (index < rating) {
                                        return Icon(Icons.star, color: Colors.yellow);
                                      } else {
                                        return Icon(Icons.star_border, color: Colors.yellow);
                                      }
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Drama",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchMoviesDrama(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> movies =
                      List<Map<String, dynamic>>.from(snapshot.data as Iterable);
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: movies.map((movie) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        movie['poster'] ?? '',
                                        width: 150,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    movie['title'] ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    movie['director'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      int rating = 0;
                                      try {
                                        var ratingString = movie['rating'];
                                        if (ratingString != null) {
                                          rating = (double.parse(ratingString)).round();
                                        }
                                      } catch (e) {
                                        print('Error parsing rating: $e');
                                      }
                                      if (index < rating) {
                                        return Icon(Icons.star, color: Colors.yellow);
                                      } else {
                                        return Icon(Icons.star_border, color: Colors.yellow);
                                      }
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Action",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchMoviesAction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> movies =
                      List<Map<String, dynamic>>.from(snapshot.data as Iterable);
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: movies.map((movie) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        movie['poster'] ?? '',
                                        width: 150,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    movie['title'] ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    movie['director'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(5, (index) {
                                      int rating = 0;
                                      try {
                                        var ratingString = movie['rating'];
                                        if (ratingString != null) {
                                          rating = (double.parse(ratingString)).round();
                                        }
                                      } catch (e) {
                                        print('Error parsing rating: $e');
                                      }
                                      if (index < rating) {
                                        return Icon(Icons.star, color: Colors.yellow);
                                      } else {
                                        return Icon(Icons.star_border, color: Colors.yellow);
                                      }
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Anime",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchMoviesAnimation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> movies =
                      List<Map<String, dynamic>>.from(snapshot.data as Iterable);
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: movies.map((movie) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        movie['poster'] ?? '',
                                        width: 150,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    movie['title'] ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Total Eps ${movie['total_episode'] ?? ''}",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
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
                Get.to(() => fromApi());
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
