import 'package:flutter/material.dart';
import 'comic_detail_page.dart';
import 'comic_edit_page.dart';

export 'comic_detail_page.dart';
export 'comic_edit_page.dart';

typedef DetailScreen = ComicDetailPage;

void main() {
  runApp(const MyApp());
}

class Comic {
  String title;
  String category;
  String description;
  Color? color;

  Comic({
    required this.title,
    required this.category,
    required this.description,
    this.color = Colors.blue,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Komik',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Comic> comics = [
    Comic(
      title: 'Boku no Hero Academia',
      category: 'Manga',
      description:
          'Boku no Hero Academia adalah manga karya Kohei Horikoshi.',
    ),
    Comic(
      title: 'Jujutsu Kaisen',
      category: 'Action',
      description:
          'Jujutsu Kaisen adalah manga karya Gege Akutami.',
    ),
  ];

  void _showAddComicDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    String selectedCategory = 'Action';

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              title: const Text(
                'Tambah Komik Baru',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Judul'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: descController,
                      decoration: const InputDecoration(labelText: 'Deskripsi'),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      initialValue: selectedCategory,
                      decoration: const InputDecoration(),
                      items: const [
                        DropdownMenuItem(value: 'Manga', child: Text('Manga')),
                        DropdownMenuItem(value: 'Action', child: Text('Action')),
                        DropdownMenuItem(value: 'Fantasy', child: Text('Fantasy')),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setDialogState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.trim().isNotEmpty) {
                      setState(() {
                        comics.add(
                          Comic(
                            title: titleController.text.trim(),
                            description: descController.text.trim(),
                            category: selectedCategory,
                          ),
                        );
                      });
                      Navigator.pop(dialogContext);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Komik'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: comics.length,
        itemBuilder: (context, index) {
          final comic = comics[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComicDetailPage(comic: comic),
                  ),
                );
              },
              onLongPress: () async {
                final updatedComic = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ComicEditPage(comic: comic),
                  ),
                );
                if (updatedComic != null) {
                  setState(() {});
                }
              },
              onDoubleTap: () {
                final deletedTitle = comic.title;
                setState(() {
                  comics.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Data '$deletedTitle' sudah dihapus"),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    const Icon(Icons.book, color: Colors.blue, size: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comic.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            comic.category,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddComicDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
