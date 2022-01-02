import 'package:flutter/foundation.dart';
import 'package:flutter_calc/services/shared.localstorage.dart';
import 'package:flutter_calc/viewmodel/settings.viewmodel.dart';

class AppController {
  static final AppController instance = AppController._();
  AppController._() {
    //settingsViewmodel.init();
  }

  final SettingsViewmodel settingsViewmodel =
      SettingsViewmodel(SharedLocalStorageService());

  bool get isDark => settingsViewmodel.theme.value;
  ValueNotifier<bool> get theme => settingsViewmodel.theme;
}
