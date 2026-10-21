import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView dengan Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// Model data untuk menyimpan informasi setiap elemen
class AppData {
  final String title;
  final String subtitle;
  final String additionalInfo;
  final Color iconColor;

  AppData({
    required this.title,
    required this.subtitle,
    required this.additionalInfo,
    required this.iconColor,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Daftar data yang akan ditampilkan di ListView
  final List<AppData> appList = [
    AppData(
      title: 'Native App',
      subtitle: 'Android, iOS',
      additionalInfo: 'Java, Kotlin, Swift, C#',
      iconColor: Colors.red,
    ),
    AppData(
      title: 'Hybrid App',
      subtitle: 'Android, iOS, Web',
      additionalInfo: 'Javascript, Dart',
      iconColor: Colors.grey,
    ),
  ];

  // Fungsi untuk memunculkan dialog detail
  void _showDetailDialog(BuildContext context, AppData data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Detail',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                data.subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(
                data.additionalInfo,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView dengan Dialog'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // Menggunakan ListView.builder untuk merender daftar elemen
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: appList.length,
        itemBuilder: (context, index) {
          final data = appList[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: data.iconColor,
                radius: 15,
              ),
              title: Text(
                data.title,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(data.subtitle),
              // Menampilkan dialog saat elemen di klik
              onTap: () => _showDetailDialog(context, data),
            ),
          );
        },
      ),
    );
  }
}