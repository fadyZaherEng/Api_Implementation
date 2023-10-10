import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class GetAppVersionUseCase {
  SharedPreferences sharedPreferences;

  GetAppVersionUseCase({required this.sharedPreferences});

  Future<String?> call() async {
    return sharedPreferences.getString(SharedPreferenceKeys.appVersion);
  }
}
