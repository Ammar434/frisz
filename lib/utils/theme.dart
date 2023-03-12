import 'package:flutter/material.dart';
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'text_style.dart';

ThemeData initTheme() {
  Color backgroundColor = const Color(0xfffafcfc);
  Color primaryColor = const Color(0xff1d93c1);

  Color iconColor = const Color(0xff1d93c1);

  final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: backgroundColor,
    secondaryKey: primaryColor,
    // tertiaryKey: iconColor,
    tones: FlexTones.vivid(Brightness.light),
  );

  TextThemeProvider textThemeProvider = TextThemeProvider();

  ThemeData appTheme = ThemeData(
    useMaterial3: true,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.transparent,
    // ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(buttonColor: primaryColor),
    // brightness: Brightness.dark,
    colorScheme: schemeLight,
    textTheme: TextTheme(
      titleLarge: textThemeProvider.title1,
      titleMedium: textThemeProvider.title2,
      headlineLarge: textThemeProvider.appTitle,
      displayLarge: textThemeProvider.h1,
      displayMedium: textThemeProvider.h2,
      displaySmall: textThemeProvider.h3,
      bodyLarge: textThemeProvider.body,
      bodyMedium: textThemeProvider.bodySmall,
      bodySmall: textThemeProvider.bodySmall,
      labelLarge: textThemeProvider.btn,
    ),
  );

  return appTheme;
}
