import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class TextFieldApp extends StatelessWidget {
  final String hintText;

  final TextEditingController? controller;

  final bool expands,readOnly, obscureText, disableBorder, disableFocusBorder;

  final TextInputType textInput;

  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon;
  final Widget? fixIcon;
  final ValueChanged<String>? onChanged;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double radius;
  final bool isMultiLine;
  final String? labelText;
  final EdgeInsetsGeometry? contentPadding;
  final bool isRequired;
  final ValueChanged<String>? onSubmit;
  final List<TextInputFormatter> inputFormatter;
  final double? height;
  final TextStyle? hintStyle;

  const TextFieldApp({
    Key? key,
    this.radius = 28,
    this.hintText = '',
    this.controller,
    this.obscureText = false,
    this.hintStyle,
    this.isRequired=true,
    this.disableBorder = false,
    this.isMultiLine = false,
    this.height,
    this.disableFocusBorder = false,
    this.validator,
    this.onTap,
    this.icon,
    this.labelText,
    this.fixIcon,
    this.onChanged,
    this.fillColor,
    this.contentPadding,
    this.onSubmit,
    this.inputFormatter = const [],
    this.textStyle,
    this.textInput = TextInputType.text,
    this.readOnly = false,  this.expands=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        labelText!=null?  Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [5.ws,
              Text(labelText!,style: AppTextStyle.font19black500.copyWith(fontWeight: FontWeight.w400),),
              2.ws,
            // isRequired?  Text("*",style:  AppTextStyle.font16black400.copyWith(color: AppColor.red),):SizedBox(),
            ],
          ),
        ):SizedBox(),
        0.hs,
        SizedBox(
          height: isMultiLine ? height?.h ?? 88.h : null,

          child: TextFormField(

            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            minLines:isMultiLine?null: 1,
            maxLines: isMultiLine?null:1,
            inputFormatters: inputFormatter,
            onFieldSubmitted: onSubmit,textAlignVertical:isMultiLine? TextAlignVertical.top:null,
            onChanged: onChanged,
            expands: isMultiLine,
            keyboardType: textInput,
            textAlign: TextAlign.start,
            controller: controller,
            cursorWidth: 2,
            obscureText: obscureText,
            validator: validator,
            readOnly: readOnly,
            style: textStyle ?? AppTextStyle.font14black400,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: icon,

              suffixIcon: fixIcon,
              suffixIconConstraints: BoxConstraints(maxHeight: 50.h,maxWidth: 100.w),
              filled: true,
              fillColor:fillColor?? Color(0xFFF6F6F6),
              errorStyle: AppTextStyle.font13Red400.copyWith(fontWeight: FontWeight.w300,color: Colors.red),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: const BorderSide(color: Colors.red),
              ),
              border: disableBorder
                  ? null
                  : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(color:Color(0xFFF6F6F6))),

              hintStyle: hintStyle ?? AppTextStyle.font17black400.copyWith(color: Color(0xFF818181)),
              labelStyle: textStyle ?? AppTextStyle.font19black500.copyWith(fontWeight: FontWeight.w400),


              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width:1.3.w,
                    color: disableBorder ? Colors.transparent : Color(0xFFEBEBEB)),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                    width: 1,
                    color:
                    disableFocusBorder ? Colors.transparent : AppColor.black),
              ),
              enabled: true,
              contentPadding: contentPadding ??
                  EdgeInsets.only(top: 13.h, right: 10.w, bottom: 13.h, left: 20.w),
              // labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}
