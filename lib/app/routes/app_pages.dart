import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/Biodata/bindings/biodata_binding.dart';
import '../modules/Biodata/views/biodata_view.dart';
import '../modules/Biodata/views/output_view.dart';
import '../modules/Bottom_Menu/bindings/bottom_menu_binding.dart';
import '../modules/Bottom_Menu/views/bottom_menu_view.dart';
import '../modules/Counter/bindings/counter_binding.dart';
import '../modules/Counter/views/counter_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/Register/bindings/register_binding.dart';
import '../modules/Register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_MENU;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()], // get page
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => const CounterView(),
      binding: CounterBinding(),
      middlewares: [AuthMiddleware()], // get page
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => const BiodataView(),
      binding: BiodataBinding(),
      middlewares: [AuthMiddleware()], // get page
    ),
    GetPage(
      name: _Paths.OUTPUT,
      page: () => OutputView(),
      // binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()], // get page
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => BottomMenuView(),
      binding: BottomMenuBinding(),
      middlewares: [AuthMiddleware()]
    ),
  ];
}
