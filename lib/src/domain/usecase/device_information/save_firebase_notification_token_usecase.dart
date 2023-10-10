import 'package:shared_preferences/shared_preferences.dart';
import 'package:talent_link/src/core/resources/shared_preferences_keys.dart';

class SaveFirebaseNotificationTokenUseCase {
  final SharedPreferences sharedPreferences;

  SaveFirebaseNotificationTokenUseCase({required this.sharedPreferences});

  Future<bool?> call({required String firebaseNotificationToken}) async {
    return await sharedPreferences.setString(
        SharedPreferenceKeys.firebaseToken, firebaseNotificationToken);
  }
}
