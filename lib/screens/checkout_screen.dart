import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Checkout',
          style: GoogleFonts.lato(
            color: const Color(0xFF181725),
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildDetailRow(
                context: context,
                title: 'Delivery',
                value: 'Select Method',
                onTap: () {
                  // Handle delivery method selection
                },
              ),
              const Divider(height: 40, color: Color(0xFFE2E2E2)),
              _buildDetailRow(
                context: context,
                title: 'Payment',
                trailing:
                    const Icon(Icons.credit_card, color: Color(0xFF181725)),
                onTap: () {
                  // Handle payment method selection
                },
              ),
              const Divider(height: 40, color: Color(0xFFE2E2E2)),
              _buildDetailRow(
                context: context,
                title: 'Promo Code',
                value: 'Pick discount',
                onTap: () {
                  // Handle promo code selection
                },
              ),
              const Divider(height: 40, color: Color(0xFFE2E2E2)),
              _buildDetailRow(
                context: context,
                title: 'Total Cost',
                value: '\$13.97',
                onTap: () {
                  // Handle total cost details
                },
              ),
              const Divider(height: 40, color: Color(0xFFE2E2E2)),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: const Color(0xFF7C7C7C),
                    fontWeight: FontWeight.w600,
                  ),
                  children: const <TextSpan>[
                    TextSpan(text: 'By placing an order you agree to our\n'),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(color: Color(0xFF181725)),
                    ),
                    TextSpan(text: ' And '),
                    TextSpan(
                      text: 'Conditions',
                      style: TextStyle(color: Color(0xFF181725)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: const Color(0xFFF2F3F2),
        padding: const EdgeInsets.all(25.0),
        child: SizedBox(
          width: double.infinity,
          height: 67,
          child: ElevatedButton(
            onPressed: () {
              context.push('/order_accepted_screen');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF53B175),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Text(
              'Place Order',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required BuildContext context,
    required String title,
    String? value,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              color: const Color(0xFF7C7C7C),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              if (value != null)
                Text(
                  value,
                  style: GoogleFonts.lato(
                    color: const Color(0xFF181725),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: trailing,
                ),
              const SizedBox(width: 15),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFF181725),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
