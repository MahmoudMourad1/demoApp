import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/routes/app_route_name.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
// import 'package:user/features/layout/manager/cubit.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../generated/assets.dart';

class DefaultAppBarDetails extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? action;
  final bool isHome;
  final bool isRequestSent;
  const DefaultAppBarDetails({super.key,this.isRequestSent=false, required this.title,this.action,this.isHome=false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor:Constants.isDark?AppColor.background: AppColor.blue,

      title: Text(title,style: AppTextStyle.font18black500.copyWith(color: Colors.white),),
      centerTitle: true,
      leadingWidth: 40.w,
      leading:  GestureDetector(
        onTap: (){
          if(isRequestSent){
            RouterApp.pushNamedAndRemoveUntil(RouteName.loginScreen);
          }else if(isHome){
            // LayoutCubit.get(context).changeCurrentIndex(0);

          }else{
            Navigator.pop(context);

          }
        },
        child: Container(
          margin: EdgeInsets.only(left:context.languageCode=='en'? 10.w:0,right: context.languageCode=='ar'?10.w:0),
          // padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(context.languageCode=='ar'?Icons.keyboard_arrow_right:Icons.keyboard_arrow_left,size: 25,color: Colors.blue,)),
        ),
      ),
      actions: [action??SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70.h);}
