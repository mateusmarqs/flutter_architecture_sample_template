import 'package:flutter_architecture_sample_template/data/repositories/theme/theme_repository.dart';
import 'package:flutter_architecture_sample_template/data/repositories/theme/theme_repository_local.dart';
import 'package:flutter_architecture_sample_template/data/services/shared_preferences_service.dart';
import 'package:flutter_architecture_sample_template/main_viewmodel.dart';
import 'package:flutter_architecture_sample_template/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
      Provider(create: (_) => SharedPreferencesService()),
      ChangeNotifierProvider(
        create: (context) => ThemeRepositoryLocal(
          sharedPreferencesService: context.read<SharedPreferencesService>(),
        ) as ThemeRepository,
      ),
      ChangeNotifierProvider(
        create: (context) => MainViewModel(
          themeRepository: context.read(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeViewModel(
          themeRepository: context.read(),
        ),
      ),
    ];
}
  
