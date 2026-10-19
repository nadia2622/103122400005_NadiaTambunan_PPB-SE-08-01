import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToeflScreen(),
    );
  }
}

class ToeflScreen extends StatelessWidget {
  const ToeflScreen({super.key});

  final List<Map<String, String>> riwayatTes = const [
    {'tanggal': '02/03/2022', 'nilai': '150'},
    {'tanggal': '01/02/2022', 'nilai': '140'},
    {'tanggal': '12/01/2022', 'nilai': '170'},
    {'tanggal': '11/12/2021', 'nilai': '110'},
    {'tanggal': '10/11/2021', 'nilai': '180'},
    {'tanggal': '09/10/2021', 'nilai': '130'},
    {'tanggal': '02/03/2021', 'nilai': '150'},
    {'tanggal': '01/02/2021', 'nilai': '140'},
    {'tanggal': '12/01/2021', 'nilai': '170'},
    {'tanggal': '11/12/2020', 'nilai': '110'},
    {'tanggal': '10/11/2020', 'nilai': '180'},
    {'tanggal': '09/10/2020', 'nilai': '130'},
    {'tanggal': '02/03/2020', 'nilai': '150'},
    {'tanggal': '01/02/2020', 'nilai': '160'},
    {'tanggal': '12/01/2020', 'nilai': '165'},
    {'tanggal': '11/12/2019', 'nilai': '170'},
    {'tanggal': '10/11/2019', 'nilai': '160'},
    {'tanggal': '09/10/2019', 'nilai': '160'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 24,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/nadia.jpg',
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Welcome,',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF673AB7),
                        ),
                      ),
                      Text(
                        '103122400005 - Nadia Tambunan',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2196F3), Color(0xFFE040FB)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Status tes TOEFL Anda:',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'LULUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _ScoreSubItem(title: 'Listening', score: '80'),
                        _ScoreSubItem(title: 'Structure', score: '80'),
                        _ScoreSubItem(title: 'Reading', score: '90'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Riwayat Tes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: riwayatTes.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    thickness: 0.8,
                    color: Color(0xFFE0E0E0),
                  ),
                  itemBuilder: (context, index) {
                    final item = riwayatTes[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tanggal tes:',
                                style: TextStyle(
                                  color: Color(0xFF448AFF),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Nilai: ${item['nilai']}',
                                style: const TextStyle(
                                  color: Color(0xFF448AFF),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                item['tanggal']!,
                                style: const TextStyle(
                                  color: Color(0xFF448AFF),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item['nilai']!,
                                style: const TextStyle(
                                  color: Color(0xFF448AFF),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreSubItem extends StatelessWidget {
  final String title;
  final String score;

  const _ScoreSubItem({required this.title, required this.score});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 11),
        ),
        const SizedBox(height: 4),
        Text(
          score,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
