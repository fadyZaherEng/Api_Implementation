import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveDeviceSerialUseCase {
  final SharedPreferences sharedPreferences;

  SaveDeviceSerialUseCase({required this.sharedPreferences});

  Future<bool?> call(String serial) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.deviceSerial, serial);
  }
}
