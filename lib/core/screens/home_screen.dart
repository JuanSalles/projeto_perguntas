import 'package:flutter/material.dart';

import '../data/mini_apps.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Estudos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: miniApps.length,
        itemBuilder: (context, index) {
          final miniApp = miniApps[index];
          return Card(
            child: ListTile(
              leading: Icon(miniApp.icone),
              title: Text(miniApp.titulo),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: miniApp.construirTela),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
