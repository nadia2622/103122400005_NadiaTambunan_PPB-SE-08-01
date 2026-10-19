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
      title: 'Tugas PPB Modul 5',
      theme: ThemeData(
        // Latar belakang utama menggunakan warna abu-abu sangat terang agar kontras dengan maroon/hitam
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BerandaPage(),
    const PesanPage(),
    const BiodataPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFF121212), // Hitam pekat
        selectedItemColor: const Color(0xFFD4AF37), // Emas
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// 1. PAGE BERANDA
class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Latar belakang Maroon di bagian atas
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          color: const Color(0xFF800000), // Maroon
          padding: const EdgeInsets.only(top: 60),
          child: const Text(
            'Beranda',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFD4AF37), // Emas
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        // Kontainer putih dengan sudut melengkung di atasnya
        Positioned(
          top: MediaQuery.of(context).size.height * 0.45,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'PPB MODUL 5!',
                    style: TextStyle(
                      color: Color(0xFF121212), // Hitam
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        'Random Text 1',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF800000),
                        ),
                      ),
                      Text(
                        'Random Text 2',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF800000),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Hari ini.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// 2. PAGE PESAN
class PesanPage extends StatelessWidget {
  const PesanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pesanList = [
      {
        'nama': 'Bebe Upi <3',
        'pesan': 'Bebe, insyaaAllah malming kita ngedet yuk...',
        'waktu': '07:45 AM',
        'warna': const Color(0xFF800000), // Maroon
      },
      {
        'nama': 'Tila',
        'pesan': 'Lucu ya kamu',
        'waktu': '08:30 AM',
        'warna': const Color(0xFF121212), // Hitam
      },
    ];

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Pesan',
              style: TextStyle(
                color: Color(0xFF800000), // Maroon
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: pesanList.length,
              itemBuilder: (context, index) {
                final item = pesanList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFD4AF37).withOpacity(0.3),
                    ), // Border Emas tipis
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: item['warna'],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chat_bubble,
                        color: Color(0xFFD4AF37),
                        size: 20,
                      ), // Icon Emas
                    ),
                    title: Text(
                      item['nama'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      item['pesan'],
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                    trailing: Text(
                      item['waktu'],
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 3. PAGE BIODATA
class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Form Biodata',
                style: TextStyle(
                  color: Color(0xFF121212), // Hitam
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildTextField(icon: Icons.person_outline, hint: 'Nama Lengkap'),
            const SizedBox(height: 16),
            _buildTextField(icon: Icons.badge_outlined, hint: 'NIM'),
            const SizedBox(height: 16),
            _buildTextField(icon: Icons.school_outlined, hint: 'Jurusan'),
            const SizedBox(height: 16),
            _buildTextField(icon: Icons.cake_outlined, hint: 'Umur'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required IconData icon, required String hint}) {
    return TextField(
      cursorColor: const Color(0xFF800000), // Cursor Maroon
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(
          icon,
          color: const Color(0xFFD4AF37),
          size: 22,
        ), // Icon Emas
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xFF800000),
            width: 2,
          ), // Border aktif Maroon
        ),
      ),
    );
  }
}
