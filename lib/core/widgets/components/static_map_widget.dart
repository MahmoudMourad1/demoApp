import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/utils/app_utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:user/core/widgets/components/app_image_view.dart';
import 'package:user/utils/app_utils/constants.dart';

class StaticMapWidget extends StatefulWidget {
  final LatLng location;
  const StaticMapWidget({super.key,required this.location});

  @override
  State<StaticMapWidget> createState() => _StaticMapWidgetState();
}

class _StaticMapWidgetState extends State<StaticMapWidget> {
  @override
  Widget build(BuildContext context) {
    return AppImageView(
      url: 'https://maps.googleapis.com/maps/api/staticmap?center=${widget.location.latitude},${widget.location.longitude}&zoom=14&size=${MediaQuery.sizeOf(context).width.floor()}x170&style=feature:all&style=feature:road|element:geometry&key=${Constants.mapKey}',
      fit: BoxFit.fill,width: double.infinity,margin: EdgeInsets.zero,
      onTap: (){
        _openGoogleMaps(widget.location.latitude, widget.location.longitude);
      },
      radius: BorderRadius.circular(15),
    );
  }
  void _openGoogleMaps(double lat, double lng) async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.location.latitude},${widget.location.longitude}';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
