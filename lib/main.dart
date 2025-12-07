import 'package:flutter/material.dart';
import 'SettingsPage.dart';
import 'ProfilePage.dart';
import 'SearchPage.dart';
import 'HomePage.dart';
import 'CategoriesPage.dart';

void main() {
  runApp(const MyApp());
}

/// نموذج بيانات للمنتج
class Product {
  final String id;
  final String name;
  final String category;
  final String price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

/// بيانات تجريبية للمنتجات
final List<Product> sampleProducts = [
  Product(
    id: 'p1',
    name: 'Galaxy S24',
    category: 'Samsung',
    price: '\$899',
    imageUrl:
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=800',
    description: 'Powerful performance, excellent camera, sleek design.',
  ),
  Product(
    id: 'p2',
    name: 'iPhone 15',
    category: 'iPhone',
    price: '\$999',
    imageUrl:
        'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=800',
    description: 'Iconic iOS experience, great camera, top performance.',
  ),
  Product(
    id: 'p3',
    name: 'P60 Pro',
    category: 'Huawei',
    price: '\$749',
    imageUrl:
        'https://images.unsplash.com/photo-1510557880182-3f8f0b6d9b8b?w=800',
    description: 'High-resolution camera and long battery life.',
  ),
  Product(
    id: 'p4',
    name: 'Xiaomi 13',
    category: 'Xiaomi',
    price: '\$599',
    imageUrl:
        'https://images.unsplash.com/photo-1510552776732-01acc3a1e3e7?w=800',
    description: 'Excellent value-for-money with fast charging.',
  ),
  Product(
    id: 'p5',
    name: 'Galaxy A55',
    category: 'Samsung',
    price: '\$379',
    imageUrl:
        'https://images.unsplash.com/photo-1512496015851-a90fb38ba796?w=800',
    description: 'Mid-range with balanced specs and good battery.',
  ),
];

const List<String> categories = [
  'All',
  'Samsung',
  'iPhone',
  'Huawei',
  'Xiaomi',
  'Oppo',
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Store',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      debugShowCheckedModeBanner: false,
      home: const MainShell(),
    );
  }
}

/// ---- MainShell ---- يحتوي البار السفلي والصفحات ----
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  late final TextEditingController homeInputController;
  late final TextEditingController homeOutputController;

  @override
  void initState() {
    super.initState();
    homeInputController = TextEditingController();
    homeOutputController = TextEditingController();
  }

  @override
  void dispose() {
    homeInputController.dispose();
    homeOutputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        inputController: homeInputController,
        outputController: homeOutputController,
      ),
      CategoriesPage(
        onCategorySelected: (cat) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CategoryProductsPage(category: cat),
            ),
          );
        },
      ),
      const SearchPage(),
      const ProfilePage(),
      const SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Store'),
        backgroundColor: Colors.blueGrey,
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

/// -------------------- Category Products Page --------------------
class CategoryProductsPage extends StatelessWidget {
  final String category;

  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final products = (category == 'All')
        ? sampleProducts
        : sampleProducts.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Phones'),
        backgroundColor: Colors.blueGrey,
      ),
      body: products.isEmpty
          ? const Center(child: Text('No products in this category'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, idx) {
                final p = products[idx];
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
                  subtitle: Text(p.price),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(product: p),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

/// -------------------- Product Details Page --------------------
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blueGrey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
                errorBuilder: (c, e, s) => Container(
                  height: 220,
                  color: Colors.grey[200],
                  child: const Icon(Icons.broken_image, size: 72),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              product.price,
              style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            const SizedBox(height: 12),
            Text(
              'Category: ${product.category}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(product.description),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to cart (demo)')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
