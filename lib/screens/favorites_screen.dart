import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> favoriteItems = [
      {
        'image': 'assets/images/244_1326.png',
        'name': 'Sprite Can',
        'description': '325ml, Price',
        'price': '\$1.50',
      },
      {
        'image': 'assets/images/244_1327.png',
        'name': 'Diet Coke',
        'description': '355ml, Price',
        'price': '\$1.99',
      },
      {
        'image': 'assets/images/244_1328.png',
        'name': 'Apple & Grape Juice',
        'description': '2L, Price',
        'price': '\$15.50',
      },
      {
        'image': 'assets/images/244_1329.png',
        'name': 'Coca Cola Can',
        'description': '325ml, Price',
        'price': '\$4.99',
      },
      {
        'image': 'assets/images/244_1330.png',
        'name': 'Pepsi Can',
        'description': '330ml, Price',
        'price': '\$4.99',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF181725),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFE2E2E2),
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return FavoriteListItem(
                  imagePath: item['image']!,
                  name: item['name']!,
                  description: item['description']!,
                  price: item['price']!,
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFFE2E2E2),
                height: 1,
                thickness: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                context.push('/my_cart');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF53B175),
                minimumSize: const Size(double.infinity, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
                elevation: 0,
              ),
              child: Text(
                'Add All To Cart',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFCFCFC),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class FavoriteListItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final String price;

  const FavoriteListItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 55,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF181725),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: const Color(0xFF7C7C7C),
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF181725),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF181725),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x17555E58),
            blurRadius: 15,
            offset: const Offset(2, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            context,
            icon: Icons.store_outlined,
            label: 'Shop',
            isActive: currentRoute == '/home',
            onTap: () => context.go('/home'),
          ),
          _buildNavItem(
            context,
            icon: Icons.search,
            label: 'Explore',
            isActive: currentRoute == '/explore',
            onTap: () => context.go('/explore'),
          ),
          _buildNavItem(
            context,
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            isActive: currentRoute == '/my_cart',
            onTap: () => context.go('/my_cart'),
          ),
          _buildNavItem(
            context,
            icon: Icons.favorite,
            label: 'Favourite',
            isActive: currentRoute == '/favorites',
            onTap: () => context.go('/favorites'),
          ),
          _buildNavItem(
            context,
            icon: Icons.person_outline,
            label: 'Account',
            isActive: currentRoute == '/account',
            onTap: () => context.go('/account'),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    final color = isActive ? const Color(0xFF53B175) : const Color(0xFF181725);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 24),
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
      ),
    );
  }
}