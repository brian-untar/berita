import 'package:flutter/material.dart';
import '../service/category_service.dart';
import 'home_pages.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late Future<List<String>> futureCategories;

  @override
  void initState() {
    super.initState();
    futureCategories = CategoryService().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Produk'),
      ),
      body: FutureBuilder<List<String>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada kategori.'));
          } else {
            final categories = snapshot.data!;
            return ListView.separated(
              itemCount: categories.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final cat = categories[index];
                return ListTile(
                  title: Text(
                    cat[0].toUpperCase() + cat.substring(1), // Capitalize
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    // Navigate to ProductPage, passing selected category
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductPage(selectedCategory: cat),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
