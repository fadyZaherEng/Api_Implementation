import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveDeviceOperatingSystemUseCase {
  final SharedPreferences sharedPreferences;

  SaveDeviceOperatingSystemUseCase({required this.sharedPreferences});

  Future<bool?> call(String operatingSystem) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.deviceOperatingSystem, operatingSystem);
  }
}
