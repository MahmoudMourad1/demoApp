import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user/config/style/app_color.dart';
import 'package:user/core/manager/cubit.dart';
import 'package:user/core/manager/state.dart';
import 'package:user/core/widgets/app_bar/default_appbar2.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ViewImagePage extends StatelessWidget {
  const ViewImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state) {
        AppCubit appCubit =AppCubit.get(context);

        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: DefaultAppBar2(title: '',),
          body:  Container(
              child: PhotoView(
                backgroundDecoration: BoxDecoration(
                  color: AppColor.white
                ),
                enablePanAlways: true,
                enableRotation: true,
                // tightMode: true,
                wantKeepAlive: true,
                imageProvider: NetworkImage(appCubit.selectedImage??''),
              )
          )
        );
      }
    );
  }
}
