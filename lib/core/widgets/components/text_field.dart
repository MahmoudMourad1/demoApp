import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;

  final TextEditingController? controller;
  final bool isEnable;

  final bool obscureText;
  final bool disableBorder;
  final bool disableFocusBorder;
  final bool isMultiLine;
  final TextInputType keyboardType;

  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;
  final Widget? icon;
  final Widget? fixIcon;
  final Widget? trailingLabel;

  final double radius;
    final double? height;

  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit, onChanged;
  final List<TextInputFormatter> inputFormatter;
  final TextDirection? textDirection;

  const AppTextField(
      {super.key,
      this.inputFormatter = const [],
      this.radius = 8,
      this.keyboardType = TextInputType.text,
      this.isEnable = true,
      this.obscureText = false,
      this.disableBorder = false,
      this.disableFocusBorder = false,
      this.controller,
      this.validator,
      this.onTap,
      this.icon,
      this.fixIcon,
      this.onChanged,
      this.textAlign,
      this.contentPadding,
      this.onSubmit,
      this.labelText = '',
      this.hintText = '',
      this.textDirection,
      this.isMultiLine = false,
      this.height,
      this.trailingLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (labelText != null)
              Expanded(
                child: Text(
                  labelText ?? "",
                  style: AppTextStyle.font15bold500,
                ),
              ),
            if (trailingLabel != null) trailingLabel!
          ],
        ),
        3.hs,
        SizedBox(
          height: isMultiLine ? height?.h ?? 150.h : null,
          child: TextFormField(
            onTap: onTap,
            expands: isMultiLine,
            maxLines: isMultiLine ? null : 1,
            inputFormatters: inputFormatter,
            onFieldSubmitted: onSubmit,
            textAlignVertical: isMultiLine ? TextAlignVertical.top : null,
            onChanged: onChanged,
            enabled: isEnable,
            keyboardType: isMultiLine ? TextInputType.multiline : keyboardType,
            textAlign: textAlign ?? TextAlign.start,
            controller: controller,
            textDirection: textDirection,
            obscureText: obscureText,
            validator: validator,
            style: AppTextStyle.font28bold700,
            decoration: InputDecoration(
              hintStyle: AppTextStyle.font16bold400,
              labelStyle: AppTextStyle.font15bold500,
              filled: true,
              fillColor: AppColor.white,
              suffixIcon: fixIcon,
              hintText: hintText,
              border: disableBorder
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          const BorderSide(color: AppColor.blue)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: disableBorder
                        ? Colors.transparent
                        : AppColor.blue),
                borderRadius: BorderRadius.all(Radius.circular(radius)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius)),
                borderSide: BorderSide(
                    width: 2,
                    color: disableFocusBorder
                        ? Colors.transparent
                        : AppColor.blue),
              ),
              focusedErrorBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
              enabled: true,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                  borderSide: const BorderSide(width: 2, color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
