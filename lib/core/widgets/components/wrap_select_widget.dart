import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ToggleTabs2 extends StatefulWidget {
 final List<String> taps;
 final double? width;
 final int? selectedIndex;
 final Function(int index)? onIndexChange;

 const ToggleTabs2({super.key,this.selectedIndex,required this.taps,this.onIndexChange,this.width});

  @override
  State<ToggleTabs2> createState() => _ToggleTabs2State();
}

class _ToggleTabs2State extends State<ToggleTabs2> {
  int _selectedTypeIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    if(widget.selectedIndex!=null){
      _selectedTypeIndex=widget.selectedIndex??0;
    }
    if(mounted)
      setState(() {

      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return    Wrap(
      children: List.generate(widget.taps.length, (index) => InkWell(
        onTap: (){
          if (widget.onIndexChange != null) {
            widget.onIndexChange!(index);
          }
          setState(() {
            _selectedTypeIndex=index;
          });
        },
        child: Container(
          width:widget.width!=null? MediaQuery.of(context).size.width*0.5:null,
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 9.h),
          decoration: BoxDecoration(
              borderRadius:context.languageCode=='ar'?((index==0)?BorderRadius.only(topRight: Radius.circular(34),bottomRight: Radius.circular(34)):(index==widget.taps.length-1)?BorderRadius.only(topLeft: Radius.circular(34),bottomLeft: Radius.circular(34)):null): (index==0)?BorderRadius.only(topLeft: Radius.circular(34),bottomLeft: Radius.circular(34)):(index==widget.taps.length-1)?BorderRadius.only(topRight: Radius.circular(34),bottomRight: Radius.circular(34)):null,
              color: _selectedTypeIndex==index?AppColor.blue:AppColor.blueLight5,
              border: (index!=0||index!=(widget.taps.length-1))?Border(right: BorderSide(color: Colors.white,width: 2)):null
          ),
          child: Text(
            widget.taps[index],style:_selectedTypeIndex==index?AppTextStyle.font15bold500.copyWith(color: Colors.white,fontSize: 16.sp): AppTextStyle.font16black400.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      )),
    );
  }
}
