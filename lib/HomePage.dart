import 'package:flutter/material.dart';
import 'main.dart';

/// -------------------- Home Page --------------------
class HomePage extends StatefulWidget {
  final TextEditingController inputController;
  final TextEditingController outputController;

  const HomePage({
    super.key,
    required this.inputController,
    required this.outputController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _copyValue() {
    setState(() {
      widget.outputController.text = widget.inputController.text;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Value copied to output')));
  }

  void openDetails(Product p) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailsPage(product: p)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final featured = sampleProducts.take(3).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome to Mobile Store',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text('Featured Phones', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 12),

          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                final p = featured[index];
                return GestureDetector(
                  onTap: () => openDetails(p),
                  child: Card(
                    margin: const EdgeInsets.only(right: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.network(
                                p.imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: const Icon(
                                      Icons.broken_image,
                                      size: 48,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(p.price),
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
          ),

          const SizedBox(height: 20),
          const Divider(),

          const SizedBox(height: 12),
          const Text(
            'Demo: copy input → output',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),

          TextField(
            controller: widget.inputController,
            decoration: InputDecoration(
              labelText: 'Enter a value',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.edit),
            ),
          ),

          const SizedBox(height: 12),
          TextField(
            controller: widget.outputController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Output (read-only)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.output),
            ),
          ),

          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: _copyValue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                child: const Text('Print Value'),
              ),
            ],
          ),

          const SizedBox(height: 24),
          const Text(
            'All products',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sampleProducts.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final p = sampleProducts[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    p.imageUrl,
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) {
                      return Container(
                        width: 56,
                        height: 56,
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image),
                      );
                    },
                  ),
                ),
                title: Text(p.name),
                subtitle: Text(p.category),
                trailing: Text(p.price),
                onTap: () => openDetails(p),
              );
            },
          ),
        ],
      ),
    );
  }
}
