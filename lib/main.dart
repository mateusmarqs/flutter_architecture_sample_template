import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample_template/core/dependeces.dart';
import 'package:flutter_architecture_sample_template/core/themes/theme.dart';
import 'package:flutter_architecture_sample_template/main_viewmodel.dart';
import 'package:flutter_architecture_sample_template/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: providers, child: const MainApp()),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() async {
    final viewModel = context.read<MainViewModel>();
    await viewModel.load();
  }

  @override
  Widget build(final BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return MaterialApp(
      title: 'Flutter Architecture Sample Template',
      theme:
          viewModel.darkModeEnabled ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: HomeScreen(viewModel: context.read()),
      debugShowCheckedModeBanner: false,
    );
  }
}
