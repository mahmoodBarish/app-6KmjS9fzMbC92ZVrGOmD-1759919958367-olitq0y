import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                _buildProfileHeader(),
                const SizedBox(height: 30),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.shopping_bag_outlined,
                  title: 'Orders',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.person_outline,
                  title: 'My Details',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.location_on_outlined,
                  title: 'Delivery Address',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.credit_card_outlined,
                  title: 'Payment Methods',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.local_offer_outlined,
                  title: 'Promo Cord',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notifications',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.help_outline,
                  title: 'Help',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                _AccountListTile(
                  icon: Icons.info_outline,
                  title: 'About',
                  onTap: () {},
                ),
                const Divider(color: Color(0xFFE2E2E2), height: 1),
                const SizedBox(height: 30),
                _buildLogoutButton(context),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const _CustomBottomNavBar(),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage('assets/images/244_1384.png'),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Afsar Hossen',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF181725),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF53B175),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Imshuvo97@gmail.com',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: const Color(0xFF7C7C7C),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        onPressed: () {
          context.go('/log_in');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF2F3F2),
          foregroundColor: const Color(0xFF53B175),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(Icons.logout, color: Color(0xFF53B175), size: 24),
            ),
            Expanded(
              child: Text(
                'Log Out',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF53B175),
                ),
              ),
            ),
            const SizedBox(width: 44), // To balance the icon space
          ],
        ),
      ),
    );
  }
}

class _AccountListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AccountListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF181725), size: 24),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF181725),
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Color(0xFF181725)),
          ],
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
            icon: Icons.search,
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
            icon: Icons.person,
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