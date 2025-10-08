import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cartItems = [
      {
        'image': 'assets/images/244_1149.png',
        'name': 'Bell Pepper Red',
        'description': '1kg, Price',
        'price': '\$4.99',
      },
      {
        'image': 'assets/images/244_1166.png',
        'name': 'Egg Chicken Red',
        'description': '4pcs, Price',
        'price': '\$1.99',
      },
      {
        'image': 'assets/images/244_1183.png',
        'name': 'Organic Bananas',
        'description': '12kg, Price',
        'price': '\$3.00',
      },
      {
        'image': 'assets/images/244_1200.png',
        'name': 'Ginger',
        'description': '250gm, Price',
        'price': '\$2.99',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Cart',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return _CartItemWidget(
                  item: cartItems[index],
                  isLastItem: index == cartItems.length - 1,
                );
              },
            ),
          ),
          const _CheckoutButton(),
        ],
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _CartItemWidget extends StatelessWidget {
  final Map<String, String> item;
  final bool isLastItem;

  const _CartItemWidget({
    Key? key,
    required this.item,
    this.isLastItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                item['image']!,
                width: 70,
                height: 65,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name']!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF181725),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item['description']!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _QuantityButton(icon: Icons.remove, onTap: () {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Text(
                            '1',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: const Color(0xFF181725),
                            ),
                          ),
                        ),
                        _QuantityButton(icon: Icons.add, onTap: () {}),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFFB3B3B3)),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 35),
                  Text(
                    item['price']!,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color(0xFF181725),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (!isLastItem) const Divider(height: 1, color: Color(0xFFE2E2E2)),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: const Color(0xFFE2E2E2)),
        ),
        child: Icon(
          icon,
          color:
              icon == Icons.add ? const Color(0xFF53B175) : Color(0xFFB3B3B3),
        ),
      ),
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 25),
      child: SizedBox(
        width: double.infinity,
        height: 67,
        child: ElevatedButton(
          onPressed: () {
            context.push("/checkout");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF53B175),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Go to Checkout',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF489E67),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '\$12.96',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({Key? key}) : super(key: key);

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
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3),
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
            icon: Icons.manage_search_outlined,
            label: 'Explore',
            isActive: currentRoute == '/explore',
            onTap: () => context.go('/explore'),
          ),
          _BottomNavItem(
            icon: Icons.shopping_cart,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 26),
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
    );
  }
}