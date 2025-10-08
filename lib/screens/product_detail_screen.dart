import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  bool _isFavorited = false;
  bool _isProductDetailExpanded = true;
  bool _isNutritionsExpanded = false;
  bool _isReviewExpanded = false;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildImageSection(context),
                  _buildDetailsSection(),
                ],
              ),
            ),
          ),
          _buildAddToCartButton(context),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F3F2),
      padding: const EdgeInsets.only(bottom: 25),
      child: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/244_850.png',
              height: 250,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/244_857.png',
              height: 200,
              fit: BoxFit.contain,
            ),
            Positioned(
              top: 10,
              left: 25,
              right: 25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () => context.pop(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.ios_share),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF53B175),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3B3B3),
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB3B3B3),
                      borderRadius: BorderRadius.circular(13),
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

  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Naturel Red Apple',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color(0xFF181725),
                ),
              ),
              IconButton(
                icon: Icon(
                  _isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorited ? Colors.red : const Color(0xFF7C7C7C),
                ),
                onPressed: _toggleFavorite,
              ),
            ],
          ),
          Text(
            '1kg, Price',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF7C7C7C),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Color(0xFFB3B3B3)),
                    onPressed: _decrementQuantity,
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE2E2E2)),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Text(
                      _quantity.toString(),
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: const Color(0xFF181725),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Color(0xFF53B175)),
                    onPressed: _incrementQuantity,
                  ),
                ],
              ),
              Text(
                '\$4.99',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: const Color(0xFF181725),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildExpansionTile(
            title: 'Product Detail',
            isExpanded: _isProductDetailExpanded,
            onTap: () => setState(
                () => _isProductDetailExpanded = !_isProductDetailExpanded),
            child: Text(
              'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthful and varied diet.',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: const Color(0xFF7C7C7C),
                height: 1.5,
              ),
            ),
          ),
          _buildExpansionTile(
            title: 'Nutritions',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                '100gr',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 9,
                  color: const Color(0xFF7C7C7C),
                ),
              ),
            ),
            isExpanded: _isNutritionsExpanded,
            onTap: () =>
                setState(() => _isNutritionsExpanded = !_isNutritionsExpanded),
          ),
          _buildExpansionTile(
            title: 'Review',
            trailing: Row(
              children: List.generate(
                5,
                (index) =>
                    const Icon(Icons.star, color: Color(0xFFF3603F), size: 16),
              ),
            ),
            isExpanded: _isReviewExpanded,
            onTap: () => setState(() => _isReviewExpanded = !_isReviewExpanded),
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionTile({
    required String title,
    Widget? trailing,
    required bool isExpanded,
    required VoidCallback onTap,
    Widget? child,
  }) {
    return Column(
      children: [
        const Divider(color: Color(0xFFE2E2E2), height: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF181725),
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (trailing != null) trailing,
              const SizedBox(width: 8),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                color: const Color(0xFF181725),
              ),
            ],
          ),
          onTap: onTap,
        ),
        if (isExpanded && child != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: child,
          ),
      ],
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
      child: SizedBox(
        width: double.infinity,
        height: 67,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF53B175),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          onPressed: () {
            context.push('/my_cart');
          },
          child: Text(
            'Add To Basket',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}