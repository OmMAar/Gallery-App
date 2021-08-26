import 'package:flutter/material.dart';
import 'package:nabed_test/constants/app_constants.dart';

class UserManagementBackgroundWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageBackground;

  const UserManagementBackgroundWidget({required this.width, required this.height,required this.imageBackground,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageBackground),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              AppColors.mainColor.withOpacity(0.5),
              BlendMode.hardLight),
        ),
      ),
    );
  }
}
