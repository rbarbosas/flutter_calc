import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../../app.controller.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (_) {
        return IconButton(
          icon: AppController.I.isDark
              ? const Icon(Icons.dark_mode, color: Colors.black)
              : const Icon(
                  Icons.light_mode,
                  color: Colors.white,
                ),
          onPressed: () {
            AppController.I.settingsViewmodel
                .changeTheme(!AppController.I.isDark);
          },
        );
      },
    );
  }
}
