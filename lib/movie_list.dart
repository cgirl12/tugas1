import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  List<Map<String, dynamic>> movies = [];
  File? selectedImage;

  void _addMovie(String title) {
    setState(() {
      movies.add({'title': title, 'image': selectedImage});
      selectedImage = null; // Reset gambar setelah menambahkan
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  void _showAddMovieDialog() {
    final TextEditingController titleController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Movie Title'),
                  ),
                  const SizedBox(height: 10),
                  selectedImage != null
                      ? Image.file(
                          selectedImage!,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () async {
                          await _pickImage(ImageSource.camera);
                          setModalState(() {});
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Kamera'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          await _pickImage(ImageSource.gallery);
                          setModalState(() {});
                        },
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Galeri'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        _addMovie(titleController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Tambahkan Movie'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _deleteMovie(int index) {
    setState(() {
      movies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.lime],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor:
                Colors.transparent, // Transparent untuk menunjukkan gradient
            elevation: 0, // Menghapus shadow
            centerTitle: true,
            title: const Text(
              'Movie List',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Padding di luar GridView
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Membuat 2 kolom
            crossAxisSpacing: 10, // Spasi antar kolom
            mainAxisSpacing: 10, // Spasi antar baris
            childAspectRatio: 0.7, // Rasio ukuran card (lebar vs tinggi)
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  movie['image'] != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.file(
                            movie['image'],
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.movie, size: 100),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      movie['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => _deleteMovie(index),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Hapus',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMovieDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
