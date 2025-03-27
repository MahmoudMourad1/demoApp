// import 'dart:io';
//
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:user/config/style/app_color.dart';
// import 'package:user/config/style/text_style.dart';
// import 'package:user/utils/app_utils/app_strings.dart';
// import 'package:user/utils/app_utils/constants.dart';
// import 'package:user/utils/extentions/extention.dart';
//
// class UploadItem extends StatelessWidget {
//   final String title;
//   final String id;
//   const UploadItem({super.key,required String this.title,required this.id});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CompanyAuthCubit,CompanyAuthState>(
//       listener: (context,state){},
//       builder: (context,state) {
//         CompanyAuthCubit companyAuthCubit=CompanyAuthCubit.get(context);
//         return companyAuthCubit.getImage(id)!=null?Stack(children: [
//           Padding(
//               padding: const EdgeInsets.only(bottom: 5),
//               child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius:
//                     BorderRadius.all(Radius.circular(20)),
//                   ),
//                   child: ClipRRect(
//                       borderRadius:
//                       const BorderRadius.all(Radius.circular(10)),
//                       child: Image.file(
//                           File(companyAuthCubit.getImage(id)
//                               !.path),
//                           width: MediaQuery.of(context).size.width,
//                           height:
//                           MediaQuery.of(context).size.width / 4.3,
//                           fit: BoxFit.cover)))),
//           Positioned(
//               top: 0,
//               right: 0,
//               child: InkWell(
//                   onTap: () =>
//                       companyAuthCubit.removeImage(id),
//                   child: Container(
//                       decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(10))),
//                       child: const Padding(
//                           padding: EdgeInsets.all(4.0),
//                           child: Icon(Icons.delete_forever_rounded,
//                               color: Colors.red, size: 15)))))
//         ]): GestureDetector(
//           onTap: (){
//             companyAuthCubit.showPicker(context, id,);
//           },
//           child: DottedBorder(
//             borderType: BorderType.RRect,
//             color: Color(0xFFE5950A),
//             radius: Radius.circular(12),
//             padding: EdgeInsets.all(6),
//             dashPattern: [8, 4],
//             child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(18)),
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 4.h),
//                 decoration: BoxDecoration(
//                   color:Constants.isDark?AppColor.containerColor: Color(0xFFFDFDF3),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(Icons.file_upload_outlined,color: Color(0xFFE5950A),),
//                     10.ws,
//                     Text(AppStrings.upload,style: AppTextStyle.font15bold500.copyWith(fontWeight: FontWeight.w600),),
//                     4.ws,
//                     Text(title,style: AppTextStyle.font15black400,)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
