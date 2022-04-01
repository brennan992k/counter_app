part of 'theme_cubit.dart';

@immutable
abstract class ThemeStateABS {
  ThemeMode themeMode;
  ThemeStateABS({
    required this.themeMode,
  });
}

class ThemeState extends ThemeStateABS {
  ThemeMode themeMode;
  ThemeState({
    required this.themeMode,
  }) : super(themeMode: themeMode);
}
