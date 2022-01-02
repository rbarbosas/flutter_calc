import 'package:flutter/foundation.dart';
import 'package:flutter_calc/services/localstorage.interface.dart';

class SettingsViewmodel {
  final ILocalStorage localStorage;
  SettingsViewmodel(this.localStorage);
  ValueNotifier<bool> theme = ValueNotifier(false);

  Future init() async {
    await localStorage.get('theme').then((value) {
      if (value != null) theme = theme;
    });
  }

  saveChanges() {
    localStorage.put('config', theme);
  }

  changeTheme(bool value) {
    theme.value = value;
    saveChanges();
  }

  // changeLocale(String value) {
  //   config.locale.value = value;
  //   saveChanges();
  // }
}
