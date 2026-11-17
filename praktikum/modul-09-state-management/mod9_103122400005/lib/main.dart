import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'theme/p3_theme.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kalkulator - Persona 3',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: P3Theme.darkBg,
        primaryColor: P3Theme.cyanElectric,
        colorScheme: const ColorScheme.dark(
          primary: P3Theme.cyanElectric,
          secondary: P3Theme.bluePrimary,
          surface: P3Theme.cardBg,
        ),
      ),
      home: const HomeView(),
    );
  }
}
