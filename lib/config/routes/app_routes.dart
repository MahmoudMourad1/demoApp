import 'package:flutter/material.dart';
import 'package:user/config/routes/app_route_name.dart';
import 'package:user/core/screens/choose_language_screen.dart';
import 'package:user/features/home/presentation/home_screen.dart';
import 'package:user/features/splash/presentation/splash_screen.dart';
// import 'package:user/features/home/presentation/pages/categories_screen.dart';
// import 'package:user/features/home/presentation/pages/home.dart';



class RouterApp {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      var args = settings.arguments;

      switch (settings.name) {
        // case RouteName.onBoarding:
        //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
        // case RouteName.layout:
        //   return _animateRouteBuilder( LayoutScreen(currentIndex:(args as int?)??0));
        case RouteName.chooseLanguageScreen:
          return MaterialPageRoute(builder: (_) => const ChooseLanguageScreen());
        case RouteName.settingLanguageScreen:
        // case RouteName.categoriesScreen:
        //   return MaterialPageRoute(builder: (_) => const CategoriesScreen());

        // case RouteName.chooseLanguage:
        //   return _animateRouteBuilder(const ChooseLanguageScreen());
        //
        // case RouteName.signInScreen:
        //   return _animateRouteBuilder(const SignInScreen());
        // case RouteName.searchScreen:
        //   return _animateRouteBuilder(const SearchScreen());
        // case RouteName.signUpScreen:
        //   return _animateRouteBuilder(const SignupScreen());
        // case RouteName.featuredServiceScreen:
        //   return _animateRouteBuilder(const FeaturedServiceScreen());
        // case RouteName.signInWithOtpScreen:
        //   return _animateRouteBuilder(const SignInWithOtpScreen());
        // case RouteName.serviceDetailsScreen:
        //   return _animateRouteBuilder(const ServiceDetailsScreen());
        // case RouteName.reservationHomeScreen:
        //   return _animateRouteBuilder(const BookingStep1Screen());
        // case RouteName.updatePasswordScreen:
        //   return _animateRouteBuilder(const UpdatePasswordScreen());
        // case RouteName.salonScreen:
        //   return _animateRouteBuilder(const SalongScreen());
        // case RouteName.initLocationScreen:
        //   return _animateRouteBuilder(const InitLocationScreen());
        // case RouteName.reservationHomestep2Screen:
        //   return _animateRouteBuilder(const BookingStep2Screen());
        // case RouteName.appSettingScreen:
        //   return _animateRouteBuilder(const AppSettingScreen());
        // case RouteName.appLanguageScreen:
        //   return _animateRouteBuilder(const AppLanguageScreen());
        // case RouteName.appThemeScreen:
        //   return _animateRouteBuilder(const AppThemeScreen());
        // case RouteName.editProfileScreen:
        //   return _animateRouteBuilder(const EditProfileScreen());
        // case RouteName.forgetPasswordScreen:
        //   return _animateRouteBuilder(const ForgetPasswordScreen());
        // case RouteName.newPasswordScreen:
        //   return _animateRouteBuilder(const NewPasswordScreen());
        // case RouteName.reservationDetailsScreen:
        //   return _animateRouteBuilder(const ReservationDetailsScreen());
        // case RouteName.notificationScreen:
        //   return _animateRouteBuilder(const NotificationScreen());
        // case RouteName.specialOfferScreen:
        //   return _animateRouteBuilder(const SpecialOffersScreen());
        // case RouteName.otpScreen:
        //   return _animateRouteBuilder(const OtpScreen());
        // case RouteName.categoryScreen:
        //   return _animateRouteBuilder(const CategoryScreen());
        default:
          return MaterialPageRoute(builder: (_) => const SplashScreen());
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static BuildContext? get currentContext => navigatorKey.currentContext;

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
  static Future push(
      Widget child) async {
    return await navigatorKey.currentState
        ?.push(_animateRouteBuilder(child,),);
  }
  static Future pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) async {
    return await navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
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

  static _animateRouteBuilder(Widget to, {double x = 1, double y = 0}) =>
      PageRouteBuilder(
          pageBuilder: (_, __, ___) => to,
          opaque: false,
          transitionDuration: const Duration(milliseconds: 150),
          reverseTransitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder: (context, animation, animationTime, child) {
            final tween = Tween<Offset>(
              begin: Offset(x, y),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));
            final tween2 = Tween<double>(
              begin: 0,
              end: 1,
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: FadeTransition(
                opacity: animation.drive(tween2),
                child: child,
              ),
            );
          });
}
