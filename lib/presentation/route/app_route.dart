import 'package:counter_app/presentation/screens/counter_screen/counter_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const counterScreen = '/';

  static String get initialRoute => counterScreen;

  static Route onGenerateRoutes(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case counterScreen:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
      default:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
    }
  }
}
