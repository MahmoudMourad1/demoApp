import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/routes/app_routes.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../../config/style/app_color.dart';

class DropSearchList<T> extends StatelessWidget {
  final List<T>? list;
  final String? hint;
  final T? value;
  final String Function(T)? textValue;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final bool? isRead;
  final bool isRequired;
  final String? labelText;

  const DropSearchList(
      {super.key,
        this.list,
        this.hint,
        this.isRequired=false,
        this.isRead,
        this.labelText,
        this.value,
        this.onChanged,
        this.validator, this.textValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     labelText!=null?   Padding(
       padding:   EdgeInsets.only(bottom: 14.0.h),
       child: Row(
            children: [
              Text(labelText!,style: AppTextStyle.font16black400,),
              2.ws,
              isRequired?  Text("*",style:  AppTextStyle.font16black400.copyWith(color: AppColor.red),):0.hs,
            ],
          ),
     ):SizedBox(),
        DropdownSearch<T>(

          popupProps: PopupProps.menu(


            showSelectedItems: false,
            menuProps:  MenuProps(backgroundColor: AppColor.containerColor),

            itemBuilder: (context, t, d) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
              child: Text(
                textValue?.call(t).toString()??"",
                style: AppTextStyle.font14black400,
              ),
            ),
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText:RouterApp.currentContext?.languageCode=='ar'? 'ابحث .......':'Search ....... ',
                  hintStyle: AppTextStyle.font12black2300,
                  labelStyle: AppTextStyle.font12black2400,
                  filled: true,
                  fillColor: AppColor.white,

                  border: null,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: AppColor.blue),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.red)),
                  enabled: true,
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.red)),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 60.w,
                  ),

                  // labelText: labelText,
                ),
                style: AppTextStyle.font14black400),
          ),
          items: list ?? [],
          validator: validator,
          itemAsString: textValue,


          dropdownButtonProps: DropdownButtonProps(
              padding: EdgeInsets.only(right: 20.w),
              iconSize: 28.r,
              icon:  Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 28,
                weight: 10,
                color: AppColor.black,
              )),
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: AppTextStyle.font16black400,
            dropdownSearchDecoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyle.font15black2400,
              labelStyle: AppTextStyle.font12black2300,
              filled: true,
              fillColor:AppColor.containerColor,

              border: null,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 0.4, color:AppColor.gray3),
                borderRadius: BorderRadius.all(Radius.circular(34)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: Colors.transparent),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.red)),
              enabled: true,
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.red)),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
              ),
              // errorBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: const BorderSide(color: AppColor.red)),
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: const BorderSide(color: AppColor.gray1)),
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: const BorderSide(color: AppColor.gray1)),
              // enabled: true,
              // contentPadding: EdgeInsets.only(right: 17.w),
              // labelText: labelText,
            ),
          ),
          onChanged: onChanged,
          selectedItem: value,
          enabled: isRead ?? true,
        ),
      ],
    );
  }
}
