
import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user/core/manager/state.dart';
import 'package:user/core/widgets/components/confirm_dialog.dart';
import 'package:user/core/widgets/components/rate_dialog.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:user/utils/app_utils/router_keys.dart';
import 'package:user/utils/cache_utils/pref_keys.dart';
import 'package:user/utils/helpers/cache_helper.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);
  // int _currentIndex = 0;

  // int get currentIndex => _currentIndex;
  // XFile identityImage = XFile('');
  // List<XFile> identityImages = [];
  // SwiperController _swiperController =SwiperController();
  // SwiperController get swiperController=>_swiperController;
  // bool _extendBody = true;
  // bool get extendBody => _extendBody;
  // bool _switchValue=false;
  // String _plateNumber='';
  // String _phoneNumber='';
  // bool get  switchValue =>_switchValue;
  // String get  plateNumber =>_plateNumber;
  // String get  phoneNumber =>_phoneNumber;
  // TextEditingController plateNumberController=TextEditingController();






  // int _swiperIndex=0;
  // int get swiperIndex=>_swiperIndex;
  // changeswiperIndex(int index,) {
  //   _swiperIndex = index;
  //   emit(ChangeCurrentIndex());
  // }

  bool? _isdark=CacheHelper.getData(key: PrefKeys.isDark)??false;
  bool? get isdark=>_isdark;

  changeTheme() {
    Constants.isDark = !Constants.isDark;
    CacheHelper.saveData(key: PrefKeys.isDark, value: Constants.isDark);
    _isdark=CacheHelper.getData(key: PrefKeys.isDark);
    emit(ChangeTheme());
  }
  changeLanguage({required String code}){
    if (code == 'en') {
      LocalizeAndTranslate.setLanguageCode('en');
      print(LocalizeAndTranslate.getLanguageCode());
      // print('new lang: en -- context.locale: ${RouterKeys.mainNavigatorKey.currentContext!.locale}');
      emit(ChangeLanguage());
    } else {
      LocalizeAndTranslate.setLanguageCode('ar');
      print(LocalizeAndTranslate.getLanguageCode());
      // print('new lang: ar -- context.locale: ${RouterKeys.mainNavigatorKey.currentContext!.locale}');
      emit(ChangeLanguage());

    }
  }
  void exitApp() {
   // showDialog(context: RouterKeys.mainNavigatorKey.currentContext!, builder: (Context)=>ConfirmationDialog(
   //   icon: Assets.imagesSplash,
   //   description: 'do_you_want_to_exit_the_app',
   //   onYesPressed:() {
   //     SystemNavigator.pop();
   //     exit(0);
   //   },
   // ));
  }
  String? _selectedImage;
  String? get selectedImage=>_selectedImage;
  selectImage(String image){
    _selectedImage=image;
    emit(SuccessSelectImage());
  }
  // Future<void> showPicker(BuildContext context,bool isBack,bool isProfile,bool islicence) async {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(AppStrings.uploadImages),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               GestureDetector(
  //                 onTap: () {
  //                   pickImage(context,isBack,isProfile,islicence,ImageSource.camera);
  //                 },
  //                 child: Row(
  //                   children: <Widget>[
  //                     Icon(Icons.camera_alt,color: AppColor.blue.withOpacity(0.5),),
  //                     SizedBox(width: 8.0),
  //                     Text(AppStrings.pickCamera,style: AppTextStyle.font14black400,),
  //                   ],
  //                 ),
  //               ),
  //               Padding(padding: EdgeInsets.all(8.0)),
  //               GestureDetector(
  //                 onTap: () {
  //                   pickImage(context,isBack,isProfile,islicence,ImageSource.gallery);
  //                 },
  //                 child: Row(
  //                   children: <Widget>[
  //                     Icon(Icons.photo,color: AppColor.blue.withOpacity(0.5),),
  //                     SizedBox(width: 8.0),
  //                     Text(AppStrings.pickGallery,style: AppTextStyle.font14black400,),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

//   void pickImage(context,bool isBack, bool isProfile,bool isLicense,ImageSource imgaeSource) async {
//     Navigator.of(context).pop();
//     if(isProfile){
//     } else if(isLicense==false){
//       identityImage = (await ImagePicker().pickImage(source: imgaeSource))!;
//       identityImages.add(identityImage);
//       // multipartList.add(MultipartBody('identity_images[]', identityImage));
//     }else if(isLicense==true){
//       print('image add success');
//       identityImage = (await ImagePicker().pickImage(source: imgaeSource,preferredCameraDevice: CameraDevice.rear))!;
//       identityImages.add(identityImage);
//       print('image add success');
//       print(identityImages.length);
//       // multipartListId.add(MultipartBody('identity_images_license[]', identityImage));
//     }
// emit(UploadImageSuccess());
//   }

  // void removeImage(int index){
  //   identityImages.removeAt(index);
  //   emit(RemoveImageSuccess());
  // }
}
