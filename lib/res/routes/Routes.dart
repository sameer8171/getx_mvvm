import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_mvvm/res/routes/RoutesName.dart';
import 'package:getx_mvvm/view/SplashScreen.dart';
import 'package:getx_mvvm/view/home_screen/HomeScreen.dart';
import 'package:getx_mvvm/view/login_screen/LoginScreen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.loginScreen,
            page: () => const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.homeScreen,
            page: () => const HomeScreen(),
            transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade)
      ];
}
