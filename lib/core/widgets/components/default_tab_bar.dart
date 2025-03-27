// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:soug/config/style/app_color.dart';
// import 'package:soug/config/style/text_style.dart';
// import 'package:soug/features/property_rent_sale/data/models/property_type_model.dart';
// import 'package:soug/features/property_rent_sale/domain/use_cases/property_search_usecase.dart';
// import 'package:soug/features/property_rent_sale/presentation/manager/cubit.dart';
// import 'package:soug/utils/extentions/extention.dart';
//
// class DefaultTabBar extends StatefulWidget {
// final  List<String> tabs;
// final bool? isProperty;
// final GestureTapCallback? onPress;
//   const DefaultTabBar({super.key,required this.tabs,this.onPress,this.isProperty});
//
//   @override
//   State<DefaultTabBar> createState() => _DefaultTabBarState();
// }
//
// class _DefaultTabBarState extends State<DefaultTabBar> {
//   int _selectedIndex=0;
//   @override
//   Widget build(BuildContext context) {
//     if (widget.isProperty!=null) {
//       setState(() {
//           // _selectedIndex=PropertyCubit.get(context).propertyTypeList.indexOf(PropertyCubit.get(context).selectedPropertyTypeModel??PropertyTypeModel());
//       });
//     }
//     return SizedBox(
//       height: 27.h,
//       child: ListView.separated(
//         padding: EdgeInsets.only(left: 17.w),
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (context,index)=>InkWell(
//             onTap: (){
//               setState(() {
//                 _selectedIndex=index;
//
//               });
//               if (widget.isProperty!=null&&_selectedIndex!=0) {
//                 PropertyCubit.get(context).selectPropertyType(propertyTypeModel: PropertyCubit.get(context).propertyTypeList.elementAt(_selectedIndex));
//                 PropertyCubit.get(context)
//                     .getProperties(PropertySearchParameters(
//                     bedroom:
//                     PropertyCubit.get(context).bedroomcounter != 0 ?  PropertyCubit.get(context).bedroomcounter .toString() : null,
//                     city_id: PropertyCubit.get(context).selectedCity?.id,
//                     pathroom:  PropertyCubit.get(context).bathroomcounter  != 0 ? PropertyCubit.get(context).bathroomcounter.toString() : null,
//                     price_end: PropertyCubit.get(context).maxPrice.text,
//                     price_start: PropertyCubit.get(context).minPrice.text,
//                     property_type: PropertyCubit.get(context).selectedPropertyTypeModel?.id
//                 ));
//               }
//             },
//             child: Column(
//                     children: [
//             Container(
//                 padding: EdgeInsets.only(
//                   bottom: 4, // Space between underline and text
//                 ),
//                 decoration:_selectedIndex==index? BoxDecoration(
//                   border: Border(bottom: BorderSide(color: AppColor.blue,width: 3))
//                 ):BoxDecoration(),
//                 child: Text(widget.tabs[index],style:_selectedIndex==index?AppTextStyle.font16blue400.copyWith(fontWeight: FontWeight.w500,height: 1) :AppTextStyle.font15black2400.copyWith(height: 1),)),
//
//                     ],
//                   ),
//           ), separatorBuilder: (context,index)=>20.ws, itemCount: widget.tabs.length)
//     );
//   }
// }
