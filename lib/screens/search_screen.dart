import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Egg Chicken Red',
        quantity: '4pcs, Price',
        price: '\$1.99',
        imagePath: 'assets/images/244_1864.png',
      ),
      Product(
        name: 'Egg Chicken White',
        quantity: '180g, Price',
        price: '\$1.50',
        imagePath: 'assets/images/244_1898.png',
      ),
      Product(
        name: 'Egg Pasta',
        quantity: '30gm, Price',
        price: '\$15.99',
        imagePath: 'assets/images/244_1876.png',
      ),
      Product(
        name: 'Egg Noodles',
        quantity: '2L, Price',
        price: '\$15.99',
        imagePath: 'assets/images/244_1887.png',
      ),
      Product(
        name: 'Mayonnais Eggless',
        quantity: '325ml, Price',
        price: '\$4.99',
        imagePath: 'assets/images/244_1839.png',
      ),
      Product(
        name: 'Egg Noodles',
        quantity: '330ml, Price',
        price: '\$4.99',
        imagePath: 'assets/images/244_1850.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Search',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Colors.black87),
                      hintText: 'Search Store',
                      hintStyle: GoogleFonts.lato(
                          fontSize: 14, color: Colors.grey.shade600),
                      filled: true,
                      fillColor: const Color(0xFFF2F3F2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.black),
                  onPressed: () {
                    context.push('/filters');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.7,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class Product {
  final String name;
  final String quantity;
  final String price;
  final String imagePath;

  Product({
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product_detail');
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.name,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: const Color(0xFF181725),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              product.quantity,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: const Color(0xFF181725),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFF53B175),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.store_outlined,
            label: 'Shop',
            isActive: currentRoute == '/home',
            onTap: () => context.go('/home'),
          ),
          _buildNavItem(
            icon: Icons.manage_search,
            label: 'Explore',
            isActive: currentRoute == '/explore',
            onTap: () => context.go('/explore'),
          ),
          _buildNavItem(
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            isActive: currentRoute == '/my_cart',
            onTap: () => context.go('/my_cart'),
          ),
          _buildNavItem(
            icon: Icons.favorite_border,
            label: 'Favourite',
            isActive: currentRoute == '/favorites',
            onTap: () => context.go('/favorites'),
          ),
          _buildNavItem(
            icon: Icons.person_outline,
            label: 'Account',
            isActive: currentRoute == '/account',
            onTap: () => context.go('/account'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    final color = isActive ? const Color(0xFF53B175) : const Color(0xFF181725);
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}