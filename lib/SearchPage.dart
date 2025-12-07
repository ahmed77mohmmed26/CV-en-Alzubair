import 'package:flutter/material.dart';
import 'main.dart';

/// -------------------- Search Page --------------------
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> results = sampleProducts;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _doSearch(String query) {
    final qLower = query.toLowerCase();
    setState(() {
      results = sampleProducts.where((p) {
        return p.name.toLowerCase().contains(qLower) ||
            p.category.toLowerCase().contains(qLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            onChanged: _doSearch,
            decoration: InputDecoration(
              labelText: 'Search products or categories',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  _doSearch('');
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: results.isEmpty
              ? const Center(child: Text('No results'))
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: results.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, idx) {
                    final p = results[idx];
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          p.imageUrl,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, s) => Container(
                            width: 56,
                            height: 56,
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                      title: Text(p.name),
                      subtitle: Text(p.category),
                      trailing: Text(p.price),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsPage(product: p),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
