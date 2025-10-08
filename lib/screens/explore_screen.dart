import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(
        title: 'Fresh Fruits\n& Vegetable',
        imagePath: 'assets/images/244_885.png',
        backgroundColor: const Color(0xFF53B175).withOpacity(0.1),
        borderColor: const Color(0xFF53B175).withOpacity(0.7),
        onTap: () {
          context.push('/category/fruits_vegetables');
        },
      ),
      CategoryItem(
        title: 'Cooking Oil\n& Ghee',
        imagePath: 'assets/images/244_896.png',
        backgroundColor: const Color(0xFFF8A44C).withOpacity(0.1),
        borderColor: const Color(0xFFF8A44C).withOpacity(0.7),
        onTap: () {
          context.push('/category/oils_ghee');
        },
      ),
      CategoryItem(
        title: 'Meat & Fish',
        imagePath: 'assets/images/244_939.png',
        backgroundColor: const Color(0xFFF7AD99).withOpacity(0.25),
        borderColor: const Color(0xFFF7AD99),
        onTap: () {
          context.push('/category/meat_fish');
        },
      ),
      CategoryItem(
        title: 'Bakery & Snacks',
        imagePath: 'assets/images/244_900.png',
        backgroundColor: const Color(0xFFD3B0E0).withOpacity(0.25),
        borderColor: const Color(0xFFD3B0E0),
        onTap: () {
          context.push('/category/bakery_snacks');
        },
      ),
      CategoryItem(
        title: 'Dairy & Eggs',
        imagePath: 'assets/images/244_928.png',
        backgroundColor: const Color(0xFFFDE598).withOpacity(0.25),
        borderColor: const Color(0xFFFDE598),
        onTap: () {
          context.push('/category/dairy_eggs');
        },
      ),
      CategoryItem(
        title: 'Beverages',
        imagePath: 'assets/images/244_905.png',
        backgroundColor: const Color(0xFFB7DFF5).withOpacity(0.25),
        borderColor: const Color(0xFFB7DFF5),
        onTap: () {
          context.push('/beverages');
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Find Products',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xFF181725),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.push('/search');
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xFF181725)),
                      hintText: 'Search Store',
                      hintStyle: GoogleFonts.lato(
                        color: const Color(0xFF7C7C7C),
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF2F3F2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.92,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      title: category.title,
                      imagePath: category.imagePath,
                      backgroundColor: category.backgroundColor,
                      borderColor: category.borderColor,
                      onTap: category.onTap,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }
}

class CategoryItem {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  CategoryItem({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  });
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18.0),
          border: Border.all(color: borderColor, width: 1.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: const Color(0xFF181725),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE6EBF3).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 37,
            offset: const Offset(0, -12),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            icon: Icons.store_outlined,
            label: 'Shop',
            isActive: currentRoute == '/home',
            onTap: () => context.go('/home'),
          ),
          _BottomNavItem(
            icon: Icons.manage_search,
            label: 'Explore',
            isActive: currentRoute == '/explore',
            onTap: () => context.go('/explore'),
          ),
          _BottomNavItem(
            icon: Icons.shopping_cart_outlined,
            label: 'Cart',
            isActive: currentRoute == '/my_cart',
            onTap: () => context.go('/my_cart'),
          ),
          _BottomNavItem(
            icon: Icons.favorite_border,
            label: 'Favourite',
            isActive: currentRoute == '/favorites',
            onTap: () => context.go('/favorites'),
          ),
          _BottomNavItem(
            icon: Icons.person_outline,
            label: 'Account',
            isActive: currentRoute == '/account',
            onTap: () => context.go('/account'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isActive = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}