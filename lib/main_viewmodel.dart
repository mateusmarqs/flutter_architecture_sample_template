import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample_template/data/repositories/theme/theme_repository.dart';

class MainViewModel extends ChangeNotifier {

  MainViewModel({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository {
    _themeRepository.addListener(() {
      notifyListeners();
    });
  }

  final ThemeRepository _themeRepository;

  bool? _darkModeEnabled;

  bool get darkModeEnabled => _darkModeEnabled ?? false;

  Future<void> load() async {
    _darkModeEnabled = await _themeRepository.darkModeEnabled;
    _themeRepository.addListener(_listner);
    notifyListeners();
  }

  _listner() async {
    _darkModeEnabled = await _themeRepository.darkModeEnabled;
    notifyListeners();
  }

  @override
  void dispose() {
    _themeRepository.removeListener(_listner);
    _themeRepository.dispose();
    super.dispose();
  }
}