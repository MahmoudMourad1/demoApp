import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/core/widgets/components/custom_button.dart';
import 'package:user/generated/assets.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/app_utils/constants.dart';

class ConfirmationDialog extends StatelessWidget {
  final String icon;
  final String? title;
  final String description;
  final Function onYesPressed;
  final bool isLogOut;
  final Function? onNoPressed;
  final bool fromOpenLocation;
  final bool loading;
  const ConfirmationDialog({super.key, required this.icon, this.title, required this.description, required this.onYesPressed,
    this.isLogOut = false, this.onNoPressed,  this.fromOpenLocation= false, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(surfaceTintColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.none,
      backgroundColor: AppColor.white,
      child: SizedBox(width: 500, child: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(top: -70,left: 0,right: 0,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(width: 100,height: 100,
                    decoration: BoxDecoration(color:AppColor.white, borderRadius: BorderRadius.circular(50)),
                    child: Padding(padding: EdgeInsets.all(30),
                        child: Image.asset( icon, width: 40.w, height: 40.h,color: AppColor.blue,)))])),


          Padding(padding: EdgeInsets.only(top: 10),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              title != null ? Padding(padding: const EdgeInsets.symmetric(horizontal:30),
                  child: Text(title ?? '', textAlign: TextAlign.center,
                      style: AppTextStyle.font18black500)) : const SizedBox(),

              Padding(padding: const EdgeInsets.all(5),
                  child: Text(description,style: AppTextStyle.font16black400, )),
              const SizedBox(height: 10),



              loading? SpinKitCircle(color: Theme.of(context).primaryColor, size: 40.0):
              Row(children: [Expanded(child: TextButton(
                onPressed: () => isLogOut ? onYesPressed() : onNoPressed != null ? onNoPressed!() : Navigator.pop(context),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).disabledColor.withOpacity(0.3), minimumSize: const Size(20, 40),
                    padding: EdgeInsets.zero, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Text(isLogOut ? 'Yes' : 'No', textAlign: TextAlign.center,
                    style: AppTextStyle.font16blue400.copyWith(color: Constants.isDark?AppColor.black:AppColor.white)),
              )),
                const SizedBox(width: 10),

                Expanded(child: CustomButton(buttonText: isLogOut ? 'No' : 'Yes',
                    onPressed: () => isLogOut ?Navigator.pop(context) : onYesPressed(),
                    backgroundColor:isLogOut ? (AppColor.gray.withOpacity(0.3)) :AppColor.blue ,
                    radius: 5, height: 40)),
              ]),

            ]),
          ),
        ],
        ),
      )),
    );
  }
}
