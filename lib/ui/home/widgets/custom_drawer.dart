import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('MVVM Flutter Architecture Examples.'),
                  Text('Creator: Mateus Marques'),
                  Text('GitHub: @mateusmarqs'),
                ],
              ), 
            ),
            ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Load List'),
              leading: const Icon(Icons.list_alt_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}