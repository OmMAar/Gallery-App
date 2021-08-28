import 'package:nabed_test/data/local/db/base/base_database.dart';
import 'package:nabed_test/data/local/db/items/item_database.dart';
import 'package:nabed_test/data/local/db/user/user_database.dart';
import 'package:nabed_test/data/network/dio_client.dart';
import 'package:nabed_test/data/network/gallery/gallery_api.dart';
import 'package:nabed_test/data/network/rest_client.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/data/sharedpref/shared_preference_helper.dart';
import 'package:nabed_test/di/module/local_module.dart';
import 'package:nabed_test/di/module/network_module.dart';
import 'package:nabed_test/stores/error/error_store.dart';
import 'package:nabed_test/stores/language/language_store.dart';
import 'package:nabed_test/stores/theme/theme_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => BaseDatabase());

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(GalleryApi(getIt<DioClient>()));

  // data sources
  getIt.registerSingleton(UserDatabase( getIt.get<BaseDatabase>()));
  getIt.registerSingleton(ItemDatabase( getIt.get<BaseDatabase>()));




  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<SharedPreferenceHelper>(),
    getIt<UserDatabase>(),
    getIt<GalleryApi>(),
    getIt<ItemDatabase>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));

  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
}
