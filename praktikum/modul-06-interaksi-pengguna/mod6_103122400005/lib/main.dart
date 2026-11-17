import "package:flutter/material.dart";
import 'package:mod6_103122400005/Album.dart';
import 'package:mod6_103122400005/navigatorPractice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final album = Album(userId: 1, id: 1, title: 'Nadia');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Model',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Data Model'), centerTitle: true),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('User ID: ${album.userId}'),
                Text('ID: ${album.id}'),
                Text('Title: ${album.title}'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstScreen(nama: album.title),
                      ),
                    );
                  },
                  child: const Text('Open Navigation Practice'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
