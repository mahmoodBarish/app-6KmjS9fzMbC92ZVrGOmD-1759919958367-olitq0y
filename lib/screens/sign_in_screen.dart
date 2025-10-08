import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.3,
              width: double.infinity,
              child: Image.asset(
                'assets/images/I244_452.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    'Get your groceries\nwith nectar',
                    style: GoogleFonts.lato(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF030303),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GestureDetector(
                    onTap: () {
                      context.push('/number_screen');
                    },
                    child: Container(
                      color: Colors.transparent, // for hit testing
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/I244_476.png',
                                width: 34,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '+880',
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF030303),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Color(0xFFE2E2E2),
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Center(
                    child: Text(
                      'Or connect with social media',
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF828282),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  _SocialButton(
                    text: 'Continue with Google',
                    icon: Icons.g_mobiledata, // Placeholder for Google 'G'
                    color: const Color(0xFF5383EC),
                    onPressed: () {
                      context.go('/home');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _SocialButton(
                    text: 'Continue with Facebook',
                    icon: Icons.facebook,
                    color: const Color(0xFF4A66AD),
                    onPressed: () {
                      context.go('/home');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _SocialButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.lato(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
