import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class SelectLocationScreen extends StatelessWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF181725)),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: -50,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/244_606.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: -80,
              right: -80,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/244_611.png',
                  width: 350,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Icon(
                    Icons.location_on_outlined,
                    size: 170,
                    color: const Color(0xFF53B175).withOpacity(0.8),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Select Your Location',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF181725),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Switch on your location to stay in tune with what’s happening in your area',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 60),
                  _buildLocationDropdown(
                    label: 'Your Zone',
                    value: 'Banasree',
                    onTap: () {},
                  ),
                  const SizedBox(height: 30),
                  _buildLocationDropdown(
                    label: 'Your Area',
                    value: 'Select your area',
                    onTap: () {},
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 67,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/home_screen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF53B175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationDropdown({
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7C7C7C),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF181725),
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF181725),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(
            color: Color(0xFFE2E2E2),
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
