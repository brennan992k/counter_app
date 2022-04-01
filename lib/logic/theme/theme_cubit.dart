import 'package:bloc/bloc.dart';
import 'package:counter_app/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  updateTheme() {
    final Brightness platformBrightness = AppTheme.platformBrightness;
    _setTheme(platformBrightness == Brightness.light
        ? ThemeMode.light
        : ThemeMode.dark);
  }

  _setTheme(ThemeMode themeMode) {
    AppTheme.setStatusBarAndNavigationBarColor(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }
}
