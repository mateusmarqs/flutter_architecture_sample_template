import 'package:flutter_architecture_sample_template/data/repositories/theme/theme_repository.dart';
import 'package:flutter_architecture_sample_template/data/services/shared_preferences_service.dart';
import 'package:flutter_architecture_sample_template/utils/result.dart';

class ThemeRepositoryLocal extends ThemeRepository {

  ThemeRepositoryLocal({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  bool? _darkModeEnabled;
  
  @override
  Future<bool> get darkModeEnabled async {
    if (_darkModeEnabled != null) {
      return _darkModeEnabled!;
    } 
    
    await _fetch();
    return _darkModeEnabled ?? false;
  }

  Future<Result<void>> _fetch() async {
      final result = await _sharedPreferencesService.fetchDarkMode();
      switch (result) {
        case Ok<String?>():
          _darkModeEnabled = result.value == 'true';
          return const Result.ok(null);
        case Error<String?>():
          return Result.error(result.error);
      }
  }

  @override
  Future<Result<void>> saveDarkMode({required bool darkMode}) async {
    try {
      final result = await _sharedPreferencesService.saveDarkMode(darkMode: darkMode);
      if (result is Error<void>) {
        return Result.error(result.error);
      }
      _darkModeEnabled = darkMode;
      return result;
    } finally {
      notifyListeners();
    }
  }
}