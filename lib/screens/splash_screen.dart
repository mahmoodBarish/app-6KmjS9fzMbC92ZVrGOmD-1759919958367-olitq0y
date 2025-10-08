import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF53B175),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 55,
                height: 64,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/I244_175.png',
                        width: 43.13,
                        height: 49.13,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 3.6,
                      child: Image.asset(
                        'assets/images/I244_174.png',
                        width: 26.42,
                        height: 23.61,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLetterImage('I244_178.png', 37.74),
                      _buildLetterImage('I244_179.png', 38.25),
                      _buildLetterImage('I244_180.png', 38.25),
                      _buildLetterImage('I244_181.png', 45.95),
                      _buildLetterImage('I244_182.png', 38.18),
                      _buildLetterImage('I244_183.png', 37.70),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      'online groceries',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500,
                      ),
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

  Widget _buildLetterImage(String assetName, double height) {
    return Image.asset(
      'assets/images/$assetName',
      height: height,
      fit: BoxFit.contain,
    );
  }
}
