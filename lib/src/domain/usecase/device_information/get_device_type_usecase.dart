import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class GetDeviceTypeUseCase {
  final SharedPreferences sharedPreferences;

  GetDeviceTypeUseCase({required this.sharedPreferences});

  Future<int?> call() async {
    return sharedPreferences.getInt(SharedPreferenceKeys.deviceType);
  }
}
