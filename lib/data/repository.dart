import 'dart:async';

import 'package:nabed_test/data/local/db/user/user_database.dart';
import 'package:nabed_test/data/sharedpref/shared_preference_helper.dart';
import 'package:nabed_test/models/gallery/gallery_model.dart';
import 'package:nabed_test/models/user/user_model.dart';

import 'local/db/items/item_database.dart';
import 'network/gallery/gallery_api.dart';

class Repository {
  // data source object
  final UserDatabase _userDatabase;
  final ItemDatabase _itemDatabase;

  // api objects
  final GalleryApi _galleryApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._sharedPrefsHelper, this._userDatabase, this._galleryApi,
      this._itemDatabase);

  // gallery: ---------------------------------------------------------------------

  Future<List<HitsModel>> getGalleryItems(
      {required int page, required int pageSize, required String key}) async {
    List<HitsModel> result = [];

    int? dataBaseCount = await _itemDatabase.getCount();
    print("database count :$dataBaseCount");
    if (dataBaseCount != null && dataBaseCount < (pageSize * page)) {
      var _weatherInfo = await _galleryApi.getGalleryInfo(
          page: page, pageSize: pageSize, key: key);
      if (_weatherInfo.hits != null && _weatherInfo.hits!.isNotEmpty) {
        for (HitsModel e in _weatherInfo.hits!) {
          await _itemDatabase.create(e);
        }
        print("==================================");
        print("result from api");
        print("==================================");
        result = _weatherInfo.hits ?? [];
      }
    } else {
      print("==================================");
      print("result from database");
      print("==================================");
      result =
          await _itemDatabase.getPagingItems(page: page, pageSize: pageSize) ??
              [];
      print("==================================");
      print("result getPagingItems length :  ${result.length}");
      print("==================================");
    }
    // _weatherInfo.hits!.map((e) async{
    //   await  _itemDatabase.create(e);
    // });

    return result;
  }

  // User Management : -----------------------------------------------------------------

  Future<UserModel> createNewAccount({required UserModel newUser}) async {
    var _user = await _userDatabase.create(newUser);
    return _user;
  }

  Future<UserModel?> accountExists(
      {required String email, required String password}) async {
    var result =
        await _userDatabase.accountExists(email: email, password: password);
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
