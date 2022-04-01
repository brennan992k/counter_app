import 'package:counter_app/core/themes/app_theme.dart';
import 'package:counter_app/logic/theme/theme_cubit.dart';
import 'package:counter_app/presentation/route/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateTheme();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        initialRoute: AppRoute.initialRoute,
        onGenerateRoute: (settings) =>
            AppRoute.onGenerateRoutes(context, settings),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context
            .select<ThemeCubit, ThemeMode>((cubit) => cubit.state.themeMode),
      );
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
