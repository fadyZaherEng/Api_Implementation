import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveDeviceTypeUseCase {
  final SharedPreferences sharedPreferences;

  SaveDeviceTypeUseCase({required this.sharedPreferences});

  Future<bool?> call(int deviceType) async {
    return await sharedPreferences.setInt(
        SharedPreferenceKeys.deviceType, deviceType);
  }
}
