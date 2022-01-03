import 'package:flutter/material.dart';
import 'package:flutter_calc/themes/defaultTheme.dart';
import 'package:flutter_calc/view/calculator.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'app.controller.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: !AppController.I.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: DefaultTheme.light,
          darkTheme: DefaultTheme.dark,
          //themeMode: ThemeMode.dark,
          home: const CalculatorPage(),
        );
      },
    );
  }
}
