import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nabed_test/common/widgets/vertical_padding.dart';
import 'package:nabed_test/constants/app_assets.dart';
import 'package:nabed_test/constants/app_constants.dart';
import 'package:nabed_test/constants/colors.dart';
import 'package:nabed_test/utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[


                  FadeInDownBig(
                    child: Container(
                      width: 200,
                      height: 200,
                      child:Image.asset(
                        AppAssets.main_logo,
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    duration: Duration(milliseconds: 1500),
                  ),
                  VerticalPadding(
                    percentage: 0.05,
                  ),


                  _buildAnimatedText(title: "Gallery App")

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildAnimatedText({required String title}) {
    Row body = new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: []);

    for(int i=0; i<title.length; i++) {
      body.children.add(_buildLetterAnimated(
          letter: title[i],
          delay: Duration(milliseconds: 200 * (i+1))
      ));
    }

      return     Container(
        width: double.infinity,
        alignment: AlignmentDirectional.center,
        child: body,
      );

  }


  Widget _buildLetterAnimated({required String letter,required Duration delay}){
    return FadeInRight(
      delay: delay,
      child: Text(
        letter,
        style: appTextStyle.hugeTSBasic.copyWith(
          color: AppColors.mainColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushReplacementNamed(Routes.mainUserManagementPage);
  }
}
