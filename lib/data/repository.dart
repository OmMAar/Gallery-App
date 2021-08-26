import 'dart:async';
import 'package:nabed_test/data/local/db/user/user_database.dart';
import 'package:nabed_test/data/network/dashboard/dashboard_api.dart';
import 'package:nabed_test/data/sharedpref/shared_preference_helper.dart';
import 'package:nabed_test/models/dashboard/dashboard_model.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/models/user/user_model.dart';
import 'local/datasources/dashboard/dashboard_datasource.dart';
import 'network/gallery/gallery_api.dart';

class Repository {
  // data source object
  final DashboardDataSource _dashboardDataSource;

  // data source object
  final UserDatabase _userDatabase;

  // api objects
  final DashboardApi _dashboardApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  final GalleryApi _galleryApi;

  // constructor
  Repository(this._dashboardApi, this._sharedPrefsHelper, this._dashboardDataSource, this._userDatabase,this._galleryApi);

  // weather: ---------------------------------------------------------------------

  Future<DashboardModel> getDashboardInfo() async {


   var _weatherInfo = await _dashboardApi.getDashboardInfo();
    return _weatherInfo;
    }

    Future<GalleryModel> getGalleryItems(
      {required int page,required int pageSize,required String key}) async {


   var _weatherInfo = await _galleryApi.getGalleryInfo(page: page, pageSize: pageSize, key: key);
    return _weatherInfo;
    }



  // User Management : -----------------------------------------------------------------


  Future<UserModel> createNewAccount({required UserModel newUser}) async {


    var _user = await _userDatabase.create(newUser);
    return _user;
  }


  Future<UserModel?> accountExists({required String email,required String password}) async {
    var result = await _userDatabase.accountExists(
      email: email,
      password: password
    );
    return result;
  }



  // Themes: -----------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}