import 'package:flutter/material.dart';
import 'package:flutter_app/Entities/livre.dart';
import 'package:flutter_app/Providers/livre_provider.dart';
import 'package:provider/provider.dart';

class LivrePage extends StatefulWidget {
  const LivrePage({Key? key}) : super(key: key);

  @override
  State<LivrePage> createState() => _LivrePageState();
}

class _LivrePageState extends State<LivrePage> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Search for books',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    context.read<Livre_Provider>().searchBooks(controller.text);
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Add Book'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                          controller: imageController,
                          decoration: InputDecoration(labelText: 'Image URL'),
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(labelText: 'Description'),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Ajouter un nouveau livre avec les données du formulaire
                          Book newBook = Book(
                            title: titleController.text,
                            image: imageController.text,
                            description: descriptionController.text,
                          );
                          context.read<Livre_Provider>().addBook(newBook);
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Add Book'),
            ),
            Expanded(
              child: Consumer<Livre_Provider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (provider.books.isEmpty) {
                    return Center(child: Text('No books found'));
                  } else {
                    return ListView.builder(
                      itemCount: provider.books.length,
                      itemBuilder: (context, index) {
                        final book = provider.books[index];
                        return ListTile(
                          title: Text(book.title),
                          leading: Image.network(
                            book.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(book.title),
                                content: Text(book.description),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
