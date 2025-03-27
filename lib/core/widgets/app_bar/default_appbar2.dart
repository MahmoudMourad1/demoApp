import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/routes/app_route_name.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/routes/app_routes_2.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../generated/assets.dart';

class DefaultAppBar2 extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget? action;
  final bool isHome;
  final bool isRequestSent;
  final bool isMyadsPay;
  final Color? color;
  const DefaultAppBar2({super.key,this.isMyadsPay=false,this.color,this.isRequestSent=false, required this.title,this.action,this.isHome=false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.h,
      backgroundColor:color??AppColor.white,

      title: Text(title,style: AppTextStyle.font18black500,),
      centerTitle: true,
      leadingWidth: 50.w,
      leading:  GestureDetector(
        onTap: (){

       if(isMyadsPay){
         RouterApp.pushNamedAndRemoveUntil(RouteName.layout,arguments: 2,);
       }else  if(isRequestSent){
           RouterApp.pushNamedAndRemoveUntil(RouteName.loginScreen);
         }else if(isHome){
            // LayoutCubit.get(context).changeCurrentIndex(0);

          }else{
            Navigator.pop(context);

          }
        },
        child: Container(
          margin: EdgeInsets.only(left:context.languageCode=='en'? 14.w:0,right: context.languageCode=='ar'?14.w:0),
          // padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            shape: BoxShape.circle,

          ),
          child: Center(child: Icon(context.languageCode=='ar'?Icons.arrow_back:Icons.arrow_back,size: 30,color: AppColor.black,)),
        ),
      ),
      actions: [action??SizedBox()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 70.h);}
