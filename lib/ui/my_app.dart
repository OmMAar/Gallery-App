import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabed_test/blocs/main/root_page_bloc.dart';
import 'package:nabed_test/constants/app_theme.dart';
import 'package:nabed_test/constants/strings.dart';
import 'package:nabed_test/data/repository.dart';
import 'package:nabed_test/di/components/service_locator.dart';
import 'package:nabed_test/ui/splash/splash.dart';
import 'package:nabed_test/utils/routes/routes.dart';
import 'package:nabed_test/stores/language/language_store.dart';
import 'package:nabed_test/stores/theme/theme_store.dart';
import 'package:nabed_test/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),

      child: MultiProvider(
        providers: [
          Provider<ThemeStore>(create: (_) => _themeStore),
          Provider<LanguageStore>(create: (_) => _languageStore),
          BlocProvider<RootPageBloc>(
            create: (context) => RootPageBloc(),
          ),

        ],
        child: Observer(
          name: 'global-observer',
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: Strings.appName,
              theme: _themeStore.darkMode ? themeDataDark : themeData,
              routes: Routes.routes,
              locale: Locale(_languageStore.locale),
              supportedLocales: _languageStore.supportedLanguages
                  .map((language) => Locale(language.locale!, language.code))
                  .toList(),
              localizationsDelegates: [
                // A class which loads the translations from JSON files
                AppLocalizations.delegate,
                // Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,
                // Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,
                // Built-in localization of basic text for Cupertino widgets
                GlobalCupertinoLocalizations.delegate,
              ],
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}