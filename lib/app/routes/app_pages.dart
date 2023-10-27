import 'package:get/get.dart';
import 'package:second_process/app/modules/home/views/home_page.dart';
import 'package:second_process/app/modules/home/views/profile_view.dart';


import '../modules/home/bindings/home_binding.dart';

import '../modules/home/views/review.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
  
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const Review(),
      binding: HomeBinding(),
    ),
      GetPage(
      name: _Paths.HOME,
      page: () => const ProfileView(),
      binding: HomeBinding(),
    ),
  ];
}
