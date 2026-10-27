import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnal ListView + FAB',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TechListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TechListPage extends StatefulWidget {
  const TechListPage({super.key});

  @override
  State<TechListPage> createState() => _TechListPageState();
}

class _TechListPageState extends State<TechListPage> {
  // List untuk menyimpan data yang ditambahkan dari form
  final List<Map<String, dynamic>> _techList = [];

  // Fungsi untuk memunculkan Dialog Form
  void _showAddDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController platformController = TextEditingController();
    final TextEditingController langController = TextEditingController();

    DateTime? selectedDate;
    String selectedColor = 'Blue';
    final List<String> colorOptions = ['Blue', 'Red', 'Green'];

    showDialog(
      context: context,
      builder: (context) {
        // Menggunakan StatefulBuilder agar UI di dalam dialog (seperti DatePicker & Dropdown) bisa di-update
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text('Add New Tech'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Tech Name'),
                    ),
                    TextField(
                      controller: platformController,
                      decoration: const InputDecoration(labelText: 'Platform'),
                    ),
                    TextField(
                      controller: langController,
                      decoration: const InputDecoration(labelText: 'Lang'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedDate == null
                              ? 'No date selected'
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                        ),
                        TextButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null && picked != selectedDate) {
                              setStateDialog(() {
                                selectedDate = picked;
                              });
                            }
                          },
                          child: const Text('Select Date'),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Colors.deepPurple.shade100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedColor,
                      decoration: const InputDecoration(
                        labelText: 'Choose Color',
                      ),
                      items: colorOptions.map((String color) {
                        return DropdownMenuItem<String>(
                          value: color,
                          child: Text(color),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setStateDialog(() {
                            selectedColor = newValue;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () =>
                      Navigator.pop(context), // Tutup dialog jika batal
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Tambahkan data ke dalam list saat Save ditekan
                    setState(() {
                      _techList.add({
                        'name': nameController.text,
                        'platform': platformController.text,
                        'lang': langController.text,
                        'date': selectedDate != null
                            ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                            : 'No Date',
                        'color': selectedColor,
                      });
                    });
                    Navigator.pop(context); // Tutup dialog setelah simpan
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Fungsi helper untuk mengubah string warna menjadi objek Color
  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Blue':
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurnal ListView + FAB'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _techList.length,
        itemBuilder: (context, index) {
          final item = _techList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: _getColor(item['color'])),
              title: Text(item['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item['platform']} - ${item['lang']}'),
                  const SizedBox(height: 4),
                  Text('Date: ${item['date']}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tampilkan Snackbar saat FAB ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('FAB Clicked'),
              action: SnackBarAction(
                label: 'Add',
                onPressed:
                    _showAddDialog, // Panggil Dialog jika action "Add" ditekan
              ),
            ),
          );
        },
        backgroundColor: Colors.deepPurple.shade50,
        child: const Icon(Icons.add, color: Colors.deepPurple),
      ),
    );
  }
}
