import 'package:flutter/material.dart';
import 'package:user/config/routes/app_route_name.dart';
import 'package:user/core/widgets/components/view_image_page.dart';
import 'package:user/features/home/presentation/home_screen.dart';
import 'package:user/features/splash/presentation/splash_screen.dart';

class RouterApp2 {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
        case RouteName.homeScreen:
          return _animateRouteBuilder(const SplashScreen());
        case RouteName.exploreScreen:
          return _animateRouteBuilder(const SplashScreen());
        case RouteName.bookingScreen:
          return _animateRouteBuilder(const SplashScreen());
        case RouteName.profileScreen:
          return _animateRouteBuilder(const SplashScreen());

        // case RouteName.favoriteScreen:
        //   return _animateRouteBuilder(const FavoriteScreen());
        // case RouteName.reservationScreen:
        //   return _animateRouteBuilder(const ReservationScreen());
        // case RouteName.accountScreen:
        //   return _animateRouteBuilder(const AccountScreen());
        // case RouteName.servicesFromSalonScreen:
        //   return _animateRouteBuilder(const ServicesFromSalonScreen());
        // case RouteName.servicesFromHomeScreen:
        //   return _animateRouteBuilder(const ServicesFromHomeScreen());


        default:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Future pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }

  static Future pushNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static pop<T>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }

  static bool get canPop => navigatorKey.currentState?.canPop() ?? false;

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('خطأ'),
        ),
        body: const Center(
          child: Text('نعتذر حدث خطأ , الرجاء اعادة المحاولة'),
        ),
      );
    });
  }

  static _animateRouteBuilder(Widget to) => PageRouteBuilder(
      pageBuilder: (_, __, ___) => to,
      opaque: false,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, animationTime, child) {
        final tween2 = Tween<double>(
          begin: 0,
          end: 1,
        );
        return child;
      });
}
