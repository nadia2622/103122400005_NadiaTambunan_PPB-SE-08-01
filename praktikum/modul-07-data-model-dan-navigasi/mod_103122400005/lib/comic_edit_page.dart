import 'package:flutter/material.dart';
import 'main.dart';

class ComicEditPage extends StatefulWidget {
  final Comic comic;

  const ComicEditPage({super.key, required this.comic});

  @override
  State<ComicEditPage> createState() => _ComicEditPageState();
}

class _ComicEditPageState extends State<ComicEditPage> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late String _selectedCategory;

  final List<String> _categories = ['Manga', 'Action', 'Fantasy'];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.comic.title);
    _descriptionController =
        TextEditingController(text: widget.comic.description);

    if (_categories.contains(widget.comic.category)) {
      _selectedCategory = widget.comic.category;
    } else {
      _selectedCategory = _categories.first;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    widget.comic.title = _titleController.text;
    widget.comic.description = _descriptionController.text;
    widget.comic.category = _selectedCategory;

    Navigator.pop(context, widget.comic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Komik'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Judul',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _selectedCategory,
                decoration: const InputDecoration(),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: _saveChanges,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: BorderSide(color: Colors.grey.shade300),
                    elevation: 1,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Perbaharui'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
