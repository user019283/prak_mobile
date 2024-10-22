import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/signin.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN; // Set SignIn sebagai halaman awal

  static final routes = [
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SignIn(), // Halaman SignIn
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(), // Halaman Home
      binding: HomeBinding(),
    ),
  ];
}