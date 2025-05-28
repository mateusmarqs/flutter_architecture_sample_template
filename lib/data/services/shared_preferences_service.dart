import 'package:flutter_architecture_sample_template/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const _darkModeKey = 'darkMode';

  Future<Result<String?>> fetchDarkMode() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      return Result.ok(sharedPreferences.getString(_darkModeKey));
    } on Exception catch (e) {
       return Result.error(e);
    }
  }

  Future<Result<void>> saveDarkMode({required bool darkMode}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(_darkModeKey, darkMode.toString());
      return const Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}