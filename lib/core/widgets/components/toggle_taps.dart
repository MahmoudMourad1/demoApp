import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/config/style/text_style.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/utils/extentions/extention.dart';

class ToggleTabs extends StatefulWidget implements PreferredSizeWidget {
  final Function(int index)? onIndexChange;
  final int count;
  final List<String> tabs;
  final List<String>? icons;
  final int? intialIndex;
  final TabController? tabController;

  const ToggleTabs(
      {super.key, this.onIndexChange,this.icons, this.count = 0, this.intialIndex,this.tabController, required this.tabs});

  @override
  State<ToggleTabs> createState() => _ToggleTabsState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 44.h);
}

class _ToggleTabsState extends State<ToggleTabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.intialIndex??0,
      length: widget.tabs.length,
      child: _tabsBuild(),
    );
  }

  Widget _tabsBuild() => Container(
    margin: EdgeInsets.symmetric(horizontal:10.w),
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(8),
    //   color: AppColor.white,
    // ),
    height: 44.h,
    child: TabBar(
      controller:widget.tabController ,
      padding: EdgeInsetsDirectional.zero,
      indicatorPadding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      isScrollable: true,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(2),
        borderSide: BorderSide(
            width: 3,
            color:AppColor.blue
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      onTap: (i) {
        setState(() {
          _index = i;
        });
        if (widget.onIndexChange != null) {
          widget.onIndexChange!(_index);
        }
      },
      labelColor: AppColor.black,
      labelStyle: AppTextStyle.font16blue400,
      unselectedLabelStyle: AppTextStyle.font16black400,
      unselectedLabelColor: AppColor.black,
      tabs: widget.tabs
          .map<Widget>((e) => Tab(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width*0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppImageView(svgPath: widget.icons?[widget.tabs.indexOf(e)],),
              8.ws,
              Text(e,style:AppTextStyle.font16black400,).withHorizontalPadding(10),
            ],
          ),
        ),
      ))
          .toList(),
    ),
  );
}
