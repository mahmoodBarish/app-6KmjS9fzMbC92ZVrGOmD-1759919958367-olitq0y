import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/244_298.png',
                width: 26,
                height: 30,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on,
                      size: 20, color: Color(0xFF4C4F4D)),
                  const SizedBox(width: 4),
                  Text(
                    'Dhaka, Banassre',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF4C4F4D),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSearchBar(context),
              const SizedBox(height: 20),
              _buildBanner(),
              const SizedBox(height: 30),
              _buildSection(
                context,
                title: 'Exclusive Offer',
                onSeeAll: () {},
                child: _buildProductList(exclusiveOffers),
              ),
              const SizedBox(height: 30),
              _buildSection(
                context,
                title: 'Best Selling',
                onSeeAll: () {},
                child: _buildProductList(bestSelling),
              ),
              const SizedBox(height: 30),
              _buildGroceriesSection(context),
              const SizedBox(height: 30),
              _buildProductList(groceriesProducts),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/search');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFFF2F3F2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Color(0xFF181B26)),
            const SizedBox(width: 10),
            Text(
              'Search Store',
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7C7C7C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage('assets/images/244_238.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 10,
              bottom: 10,
              child: Image.asset(
                'assets/images/244_256.png',
                width: 100,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 140,
              right: 15,
              top: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fresh Vegetables',
                    style: GoogleFonts.aclonica(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Get Up To 40% OFF',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF53B175),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title,
      required VoidCallback onSeeAll,
      required Widget child}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF181725),
                ),
              ),
              TextButton(
                onPressed: onSeeAll,
                child: Text(
                  'See all',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF53B175),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        child,
      ],
    );
  }

  Widget _buildProductList(List<_ProductData> products) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 25),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: _ProductCard(data: products[index]),
          );
        },
      ),
    );
  }

  Widget _buildGroceriesSection(BuildContext context) {
    return _buildSection(
      context,
      title: 'Groceries',
      onSeeAll: () {},
      child: SizedBox(
        height: 105,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 25),
          children: [
            _GroceriesCategoryCard(
              title: 'Pulses',
              imagePath: 'assets/images/244_193.png',
              color: const Color(0xFFF8A44C).withOpacity(0.15),
            ),
            const SizedBox(width: 15),
            _GroceriesCategoryCard(
              title: 'Rice',
              imagePath: 'assets/images/244_197.png',
              color: const Color(0xFF53B175).withOpacity(0.15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();
    int currentIndex = 0;
    if (currentRoute.startsWith('/explore')) {
      currentIndex = 1;
    } else if (currentRoute.startsWith('/my_cart')) {
      currentIndex = 2;
    } else if (currentRoute.startsWith('/favorites')) {
      currentIndex = 3;
    } else if (currentRoute.startsWith('/account')) {
      currentIndex = 4;
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/explore');
            break;
          case 2:
            context.go('/my_cart');
            break;
          case 3:
            context.go('/favorites');
            break;
          case 4:
            context.go('/account');
            break;
        }
      },
      selectedItemColor: const Color(0xFF53B175),
      unselectedItemColor: const Color(0xFF181725),
      selectedLabelStyle:
          GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 12),
      unselectedLabelStyle:
          GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.store_outlined),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Account',
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final _ProductData data;

  const _ProductCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product_detail');
      },
      child: Container(
        width: 174,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  data.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              data.title,
              style: GoogleFonts.lato(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF181725),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              data.unit,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: const Color(0xFF7C7C7C),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.price,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _GroceriesCategoryCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color color;

  const _GroceriesCategoryCard({
    required this.title,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.asset(
              imagePath,
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF3E4241),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductData {
  final String imagePath;
  final String title;
  final String unit;
  final String price;

  _ProductData({
    required this.imagePath,
    required this.title,
    required this.unit,
    required this.price,
  });
}

final List<_ProductData> exclusiveOffers = [
  _ProductData(
      imagePath: 'assets/images/244_323.png',
      title: 'Organic Bananas',
      unit: '7pcs, Priceg',
      price: '\$4.99'),
  _ProductData(
      imagePath: 'assets/images/244_373.png',
      title: 'Red Apple',
      unit: '1kg, Priceg',
      price: '\$4.99'),
];

final List<_ProductData> bestSelling = [
  _ProductData(
      imagePath: 'assets/images/244_268.png',
      title: 'Bell Pepper Red',
      unit: '1kg, Priceg',
      price: '\$4.99'),
  _ProductData(
      imagePath: 'assets/images/244_272.png',
      title: 'Ginger',
      unit: '250gm, Priceg',
      price: '\$4.99'),
];

final List<_ProductData> groceriesProducts = [
  _ProductData(
      imagePath: 'assets/images/244_207.png',
      title: 'Beef Bone',
      unit: '1kg, Priceg',
      price: '\$4.99'),
  _ProductData(
      imagePath: 'assets/images/244_217.png',
      title: 'Broiler Chicken',
      unit: '1kg, Priceg',
      price: '\$4.99'),
];