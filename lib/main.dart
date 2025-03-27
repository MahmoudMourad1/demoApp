import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:oktoast/oktoast.dart';
import 'package:user/blocobserve.dart';
import 'package:user/config/localization/localization.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/app_status_bar.dart';
import 'package:user/config/theme/themes.dart';
import 'package:user/core/data/notifications/firebase_notification.dart';
import 'package:user/core/data/notifications/local_notification.dart';
import 'package:user/core/manager/cubit.dart';
import 'package:user/core/manager/state.dart';
import 'package:user/core/screens/splash_screen.dart';
import 'package:user/features/splash/presentation/splash_screen.dart';
import 'package:user/service_locator.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:user/utils/helpers/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await Firebase.initializeApp(options: FirebaseOptions(
  //   apiKey: 'AIzaSyBF53A9E1VWMJYnG2KySWV65piTKLbdJKw',
  //   appId: '1:20566499297:android:e9094a6f0f1a4d6b3bbca0',
  //   messagingSenderId: '20566499297',
  //   projectId: 'zahia-app',
  //   storageBucket: 'zahia-app.firebasestorage.app',
  // ));
  // await LocalNotifications.initialize();
  // await FirebaseNotifications.init();
  // await FirebaseNotifications.listen();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  await AppLocalization.init();
  Bloc.observer = MyBlocObserver();
  ServiceLocator.init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // dark text for status bar
      statusBarColor: Colors.transparent),
  );

  AppStatusBar.setStatusBarStyle();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // runApp(const MyApp());
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) =>
          LocalizedApp(
            child: MultiBlocProvider(
              providers: [

                BlocProvider(create: (_) => AppCubit()),
                // BlocProvider(create: (_) => LayoutCubit()),




              ],
              child: BlocConsumer<AppCubit,AppState>(
                  listener: (context,state){},
                  builder: (context,state) {
                    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                      statusBarIconBrightness:
                      Constants.isDark ? Brightness.light : Brightness.dark,
                      statusBarColor: Colors.transparent, // transparent status bar
                    ));
                    return OKToast(
                      child: MaterialApp(
                        title: 'demo App',
                        debugShowCheckedModeBanner: false,
                        theme: Themes.light,
                        themeMode: Constants.isDark ? ThemeMode.dark : ThemeMode.light,
                        darkTheme: Themes.dark,
                        color: AppColor.background,
                        localizationsDelegates: context.delegates,
                        supportedLocales: context.supportedLocales,
                        locale: context.locale,
                        home: const SplashScreen(),
                        navigatorKey: RouterApp.navigatorKey,
                        // home: const LayoutScreen(),
                        onGenerateRoute: RouterApp.generateRoute,
                        // builder: LocalizeAndTranslate.directionBuilder,
                        builder: (BuildContext context, Widget? child) {
                          child = LocalizeAndTranslate.directionBuilder(context, child);

                          return child;
                        },
                        // locale: context.locale,
                        // localizationsDelegates: context.delegates,
                        // supportedLocales: context.supportedLocales,
                      ),
                    );
                  }
              ),
            ),
          ),
    );
  }
}

