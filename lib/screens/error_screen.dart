import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background screen (dimmed)
          const _BackgroundFavoritesScreen(),

          // Dim overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Error Modal Dialog
          Center(
            child: Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.all(25.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => context.pop(),
                      ),
                    ),
                    Image.asset(
                      'assets/images/244_1616.png',
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Oops! Order Failed',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF181725),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Something went terribly wrong.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF53B175),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19.0),
                          ),
                        ),
                        onPressed: () => context.pop(),
                        child: Text(
                          'Please Try Again',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 67,
                      child: TextButton(
                        onPressed: () => context.go('/home'),
                        child: Text(
                          'Back to home',
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF181725),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundFavoritesScreen extends StatelessWidget {
  const _BackgroundFavoritesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorites',
          style: GoogleFonts.lato(
            color: const Color(0xFF181725),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Divider(color: Color(0xFFE2E2E2), height: 1),
          _buildFavoriteItem(
            imagePath: 'assets/images/244_1569.png',
            title: 'Sprite Can',
            subtitle: '325ml, Price',
            price: '\$1.50',
          ),
          _buildFavoriteItem(
            imagePath: 'assets/images/244_1570.png',
            title: 'Diet Coke',
            subtitle: '355ml, Price',
            price: '\$1.99',
          ),
          _buildFavoriteItem(
            imagePath: 'assets/images/244_1571.png',
            title: 'Apple & Grape Juice',
            subtitle: '2L, Price',
            price: '\$15.50',
          ),
          _buildFavoriteItem(
            imagePath: 'assets/images/244_1572.png',
            title: 'Coca Cola Can',
            subtitle: '325ml, Price',
            price: '\$4.99',
          ),
          _buildFavoriteItem(
            imagePath: 'assets/images/244_1573.png',
            title: 'Pepsi Can',
            subtitle: '330ml, Price',
            price: '\$4.99',
            isLast: true,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF53B175),
                minimumSize: const Size(double.infinity, 67),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
              child: Text(
                'Add All To Cart',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF53B175),
        unselectedItemColor: const Color(0xFF181725),
        selectedLabelStyle:
            GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 12),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem({
    required String imagePath,
    required String title,
    required String subtitle,
    required String price,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Row(
            children: [
              Image.asset(imagePath,
                  width: 40, height: 60, fit: BoxFit.contain),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF181725),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                price,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF181725),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        if (!isLast)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(color: Color(0xFFE2E2E2), height: 1),
          ),
      ],
    );
  }
}