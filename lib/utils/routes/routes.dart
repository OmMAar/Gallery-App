import 'package:nabed_test/ui/details/page/item_details_page.dart';
import 'package:nabed_test/ui/home/pages/home_page.dart';
import 'package:nabed_test/ui/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:nabed_test/ui/user_management/pages/main_user_management_page.dart';
import 'package:nabed_test/ui/user_management/pages/sign_in_page.dart';
import 'package:nabed_test/ui/user_management/pages/sign_up_page.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String mainUserManagementPage = '/userManagement/pages/mainUserManagementPage';
  static const String signInPage = '/userManagement/pages/signInPage';
  static const String signUpPage = '/userManagement/pages/signUpPage';
  static const String home = '/home';
  static const String itemDetailsPage = '/details/page/itemDetailsPage';


  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    mainUserManagementPage: (BuildContext context) => MainUserManagementPage(),
    signInPage: (BuildContext context) => SignInPage(),
    signUpPage: (BuildContext context) => SignUpPage(),
    home: (BuildContext context) => HomeScreen(),
    itemDetailsPage: (BuildContext context) => ItemDetailsPage()

  };

}



