import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_rating/star_rating.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/utils/extentions/extention.dart';

class RateItem extends StatelessWidget {
 final String title;
 final String name;
 final double rating;
  const RateItem({super.key,required this.title,required this.name,required this.rating});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF1F1F1),
            border: Border.all(
                color: Color(0xFFDDDDDD),
                width: 5.w
            ),
          ),
          child: Center(child: Text('${name}',style: AppTextStyle.font18black600.copyWith(color: Color(0xFF969696)),)),
        ),
        16.ws,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${title}',style: AppTextStyle.font18black600,),
            6.hs,
            Row(
              children: [
                StarRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  length: 5,
                  rating: rating,
                  between: 0,
                  starSize: 24.sp,

                  color: Color(0xFFFFCA0C),

                  onRaitingTap: (rating) {
                    // print('Clicked rating: $rating / $starLength');
                    // setState(() {
                    //   _rating = rating;
                    // });
                  },
                ),
                10.ws,
                Text('${rating}',style: AppTextStyle.font16black500,)
              ],
            ),
          ],
        )
      ],
    );
  }
}
