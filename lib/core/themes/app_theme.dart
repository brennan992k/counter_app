import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        primaryColor: lightPrimaryColor,
        accentColor: lightAccentColor,
        backgroundColor: lightBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        primaryColor: darkPrimaryColor,
        accentColor: darkAccentColor,
        backgroundColor: darkBackgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static Brightness get platformBrightness =>
      WidgetsBinding.instance!.window.platformBrightness;

  static setStatusBarAndNavigationBarColor(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      statusBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? AppTheme.light.backgroundColor
          : AppTheme.dark.backgroundColor,
      systemNavigationBarIconBrightness:
          themeMode == ThemeMode.light ? Brightness.light : Brightness.dark,
    ));
  }
}

extension ParticlesColor on ThemeData {
  Color? get particlesColor => brightness == Brightness.dark
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}
