import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/widgets/components/text_formfield.dart';
import 'package:user/utils/app_utils/app_strings.dart';
import 'package:user/utils/extentions/extention.dart';

class ContainerStackTitle extends StatefulWidget {
  final String title;
  final Widget body;
  const ContainerStackTitle({super.key,required this.title,required this.body});

  @override
  State<ContainerStackTitle> createState() => _ContainerStackTitleState();
}

class _ContainerStackTitleState extends State<ContainerStackTitle> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Color(0xFFFFF4EE)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.body
              ],
            ).withHorizontalPadding(10)
        ),
        Positioned(
          top: -12,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Color(0xFFF6EBF1),width: 1.4),
                  color: Colors.white
              ),
              child: Text('${widget.title}',style: AppTextStyle.font14black600,),
            ),
          ),
        )
      ],
    );
  }
}
