
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/cache_utils/pref_keys.dart';
import 'package:user/utils/helpers/cache_helper.dart';

class Constants {
  static bool isDark = CacheHelper.getData(key: PrefKeys.isDark) ?? false;
  static bool isCompany = true;
  static bool isRentCar = false;
  static bool isSellerInfo=false;
  static bool isProfile = false;
  static bool isSearch=false;
  static bool isSalon=false;
  static bool isPlan=false;
  static bool isAddPlate=false;
  static bool isCarSearch=false;
  static bool isOtpLogin=false;
  static bool isResetPassword=false;
  static String privateTransportid='488ee9ea-28c1-11ef-bb20-8379d2b104fb';
  // static UserModel? userData;
  // static int? featureAdPrice;
  static bool isUpdate=false;
  static bool isDetails=false;
  static String mapKey='AIzaSyCseOpMax44JrDgi_HulcEXUrkLWK6sQQs';
  static String? phone;


  static const List<String> times = [
    "08:30 - 09:00",
    "09:30 - 10:00",
    "10:00 - 10:30",
    "10:30 - 11:00",
    "11:00 - 11:30",
    "12:00 - 12:30",
    "12:30 - 01:00",
    "01:00 - 01:30",
    "01:30 - 02:00",
    // "00:00 - 03:00",
    // "00:00 - 03:00",
    // "00:00 - 03:00",
  ];
  // static List<ServicesModel> servicesList = [
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesServiceimg,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:  RouterApp.currentContext?.languageCode=='ar'?'قصات الشعر':'Hair styles',
  //       status: 0),
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesProd2,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:RouterApp.currentContext?.languageCode=='ar'?'صبغة الشعر':'Hair Dye',
  //       status: 1),
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesProd3,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:RouterApp.currentContext?.languageCode=='ar'?'باديكير ومانيكير':'Pedicure and manicure',
  //       status: 2),
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesProd1,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:RouterApp.currentContext?.languageCode=='ar'?'صبغة الشعر':'Hair Dye',
  //         status: 3),
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesProd2,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:RouterApp.currentContext?.languageCode=='ar'?'صبغة الشعر':'Hair Dye',
  //       status: 1),
  //   ServicesModel(
  //       title:RouterApp.currentContext?.languageCode=='ar'? 'تجربة تصفيف شعر مميزة':'A unique hairdressing experience',
  //       image: Assets.imagesProd3,
  //       date: '10/10/2022',
  //       time: '10:30',
  //       location: RouterApp.currentContext?.languageCode=='ar'?'الدوحة':'Doha',
  //       typeName:RouterApp.currentContext?.languageCode=='ar'?'باديكير ومانيكير':'Pedicure and manicure',
  //       status: 2),
  // ];


  // static  List<ExpertModel>  expertList=[
  //   ExpertModel(
  //       title: RouterApp.currentContext!.languageCode=='ar'?'خبيرة تجميل':'Beauty expert',
  //       image: Assets.imagesExpert1,
  //       job: RouterApp.currentContext!.languageCode=='ar'?'خبيرة ميك اب':'Makeup expert'
  //   ),
  //   ExpertModel(
  //       title: RouterApp.currentContext!.languageCode=='ar'?'خبيرة تجميل':'Beauty expert',
  //       image: Assets.imagesExpert2,
  //       job: RouterApp.currentContext!.languageCode=='ar'?'خبيرة ميك اب':'Makeup expert'
  //   ),
  //   ExpertModel(
  //       title: RouterApp.currentContext!.languageCode=='ar'?'خبيرة تجميل':'Beauty expert',
  //       image: Assets.imagesExpert3,
  //       job: RouterApp.currentContext!.languageCode=='ar'?'خبيرة ميك اب':'Makeup expert'
  //   ),
  //   ExpertModel(
  //       title: RouterApp.currentContext!.languageCode=='ar'?'خبيرة تجميل':'Beauty expert',
  //       image: Assets.imagesExpert4,
  //       job: RouterApp.currentContext!.languageCode=='ar'?'خبيرة ميك اب':'Makeup expert'
  //   ),
  // ];

  static const List<int> highTraffic = [4, 5, 10, 15, 22, 29, 31];

  static const List<int> averageTraffic = [11, 12, 17, 18, 19, 24];

  static const List<int> weakTraffic = [1, 13, 20, 25, 26];
}
