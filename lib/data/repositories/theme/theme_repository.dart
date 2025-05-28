import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample_template/utils/result.dart';

abstract class ThemeRepository extends ChangeNotifier {
  Future<bool> get darkModeEnabled;
  Future<Result<void>> saveDarkMode({required bool darkMode});
}