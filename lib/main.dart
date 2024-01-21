import 'package:batur/bloc/authentification/authentification_bloc.dart';
import 'package:batur/bloc/settings/settings_bloc.dart';
import 'package:batur/firebase_options.dart';
import 'package:batur/screen/on_boarding_screen.dart';
import 'package:batur/utils/enumerate.dart';
import 'package:batur/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:batur/injection.dart' as di;

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider(
          create: (context) => di.locator<AuthentificationBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          title: "Bandung Tourism",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("id", ""),
            Locale("en", ""),
          ],
          locale: (state.languages == LanguagesEnum.indonesian)
              ? const Locale("id")
              : const Locale("en"),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: (state.themeType == ThemeEnum.system)
              ? ThemeMode.system
              : (state.themeType == ThemeEnum.light)
                  ? ThemeMode.light
                  : ThemeMode.dark,
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
