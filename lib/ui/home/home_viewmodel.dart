import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample_template/data/repositories/theme/theme_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required ThemeRepository themeRepository,
  })  : _themeRepository = themeRepository;


  final ThemeRepository _themeRepository;

  bool _darkModeEnabled = false;

  bool get darkModeEnabled => _darkModeEnabled;

  Future<void> setDarkMode({required bool darkMode}) async {
    await _themeRepository.saveDarkMode(darkMode: darkMode);
  }

  Future<void> load() async {
    _darkModeEnabled = await _themeRepository.darkModeEnabled;
    _themeRepository.addListener(_listner);
    notifyListeners();
  }

  Future<void> _listner() async {
    _darkModeEnabled = await _themeRepository.darkModeEnabled;
    notifyListeners();
  } 

  @override
  void dispose() {
    _themeRepository.removeListener(_listner);
    super.dispose();
  }
}
