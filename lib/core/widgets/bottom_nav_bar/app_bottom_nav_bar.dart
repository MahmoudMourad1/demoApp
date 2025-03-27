import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/app_shadows.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/manager/cubit.dart';
import 'package:user/core/manager/state.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:user/utils/extentions/extention.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
class DefaultBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const DefaultBottomNavBar(
      {super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
        builder: (context,state) {
          return CurvedNavigationBar(
            index: currentIndex,
            backgroundColor:Constants.isDark?Colors.black: Colors.white,
buttonBackgroundColor:Constants.isDark?Colors.black: Colors.white,
          color: Constants.isDark?Colors.black:Colors.white,
          iconPadding: 14.w,
            items: [
              // CurvedNavigationBarItem(
              //
              //   child: Assets.svgHome,
              //   label: AppStrings.home,
              //   labelStyle: GoogleFonts.albertSans(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFFBCBCBC)),
              //
              // ),
              // CurvedNavigationBarItem(
              //   child: Assets.svgExplore,
              //   label: AppStrings.explore,
              //
              //   labelStyle: GoogleFonts.albertSans(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFFBCBCBC)),
              // ),
              // CurvedNavigationBarItem(
              //   child: Assets.svgBooking,
              //   label: AppStrings.booking,
              //
              //   labelStyle: GoogleFonts.albertSans(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFFBCBCBC)),
              //
              // ),
              // CurvedNavigationBarItem(
              //   child: Assets.svgProfile,
              //   label: AppStrings.profile,
              //   labelStyle: GoogleFonts.albertSans(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xFFBCBCBC)),
              //
              // ),

            ],
            onTap: onTap,
          );
        }
    );
  }

  _bottomNavItem({
    required int index,
    String? icon,
    String? unSelectedIcon,
    required String title,
  }) {
    bool isSelected = currentIndex == index;
    return BottomNavigationBarItem(
        activeIcon: Column(
          children: [
            Container(
              height: 10.h,
              width: 24.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
                  color: AppColor.buttonColor
              ),
            ),
            AppImageView(
              svgPath:  icon ,
              width: 24.w,
              height: 24.h,
              // color: isSelected&&Constants.isDark ? AppColor.white2 : null,
              fit: BoxFit.contain,
            ).withVerticalPadding(5),
          ],
        ),
        icon: AppImageView(
          svgPath: isSelected ? icon : unSelectedIcon,
          width: 24.w,
          height: 24.h,
          color: isSelected&&Constants.isDark ? AppColor.white2 : null,
          fit: BoxFit.contain,
        ).withVerticalPadding(5),
        label: title,
        tooltip: title);
  }


}
