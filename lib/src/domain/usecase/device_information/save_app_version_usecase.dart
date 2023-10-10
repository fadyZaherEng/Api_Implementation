import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveAppVersionUseCase {
  final SharedPreferences sharedPreferences;

  SaveAppVersionUseCase({required this.sharedPreferences});

  Future<bool?> call(String appVersion) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.appVersion, appVersion);
  }
}
