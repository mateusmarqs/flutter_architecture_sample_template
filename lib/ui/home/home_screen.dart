import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample_template/ui/home/home_viewmodel.dart';
import 'package:flutter_architecture_sample_template/ui/home/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
        actions: [
          Switch(
            value: widget.viewModel.darkModeEnabled,
            thumbIcon: WidgetStateProperty.all(
              widget.viewModel.darkModeEnabled
                  ? const Icon(Icons.dark_mode, color: Colors.white,)
                  : const Icon(Icons.light_mode),
            ),
            onChanged: (value) {
              widget.viewModel.setDarkMode(darkMode: value);
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/png/logo-template-light.png',
              width: 250,
              height: 250,
            ),
            const Text(
              'Home Screen Counter',
              style: TextStyle(fontSize: 20),
            ),
            const FilledButton(onPressed: null, child: Text('Navegar'))
          ],
        ),
      ),
    );
  }
}
