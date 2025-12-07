import 'package:flutter/material.dart';
import 'main.dart';

/// -------------------- Categories Page --------------------
class CategoriesPage extends StatelessWidget {
  final void Function(String category)? onCategorySelected;

  const CategoriesPage({super.key, this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final cat = categories[index];
        return ListTile(
          leading: const Icon(Icons.category),
          title: Text(cat),
          onTap: () {
            if (onCategorySelected != null) {
              onCategorySelected!(cat);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryProductsPage(category: cat),
                ),
              );
            }
          },
        );
      },
    );
  }
}
