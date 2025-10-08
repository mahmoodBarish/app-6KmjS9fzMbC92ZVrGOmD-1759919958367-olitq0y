import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BeveragesScreen extends StatelessWidget {
  const BeveragesScreen({super.key});

  final List<Map<String, String>> productData = const [
    {
      "image": "assets/images/244_1035.png",
      "name": "Diet Coke",
      "description": "355ml, Price",
      "price": "\$1.99",
    },
    {
      "image": "assets/images/244_999.png",
      "name": "Sprite Can",
      "description": "325ml, Price",
      "price": "\$1.50",
    },
    {
      "image": "assets/images/244_1045.png",
      "name": "Apple & Grape Juice",
      "description": "2L, Price",
      "price": "\$15.99",
    },
    {
      "image": "assets/images/244_1055.png",
      "name": "Orange Juice",
      "description": "2L, Price",
      "price": "\$15.99",
    },
    {
      "image": "assets/images/244_1010.png",
      "name": "Coca Cola Can",
      "description": "325ml, Price",
      "price": "\$4.99",
    },
    {
      "image": "assets/images/244_1021.png",
      "name": "Pepsi Can",
      "description": "330ml, Price",
      "price": "\$4.99",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF181725)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Beverages',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: const Color(0xFF181725),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Color(0xFF181725)),
            onPressed: () {
              context.push('/filters');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.65,
          ),
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: productData[index],
            );
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Map<String, String> product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/product_detail');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    product['image']!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name']!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: const Color(0xFF181725),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['description']!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product['price']!,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: const Color(0xFF181725),
                    ),
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}