import 'package:flutter_calc/services/localstorage.interface.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SettingsViewmodel {
  final ILocalStorage localStorage;
  SettingsViewmodel(this.localStorage);
  RxNotifier<bool> themeMode = RxNotifier(false);

  Future init() async {
    await localStorage.get('themeMode').then((value) {
      if (value != null) themeMode.value = value;
    });
  }

  saveChanges() {
    localStorage.put('themeMode', themeMode.value);
  }

  changeTheme(bool value) {
    themeMode.value = value;
    saveChanges();
  }
}
