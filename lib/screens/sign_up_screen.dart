import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  'assets/images/244_730.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(
                      child: SizedBox(
                        width: 48,
                        height: 56,
                        child: Image.asset(
                          'assets/images/244_790.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.lato(
                        color: const Color(0xFF030303),
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Enter your credentials to continue',
                      style: GoogleFonts.lato(
                        color: const Color(0xFF7C7C7C),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildTextField(
                      label: 'Username',
                      initialValue: 'Afsar Hossen Shuvo',
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                      label: 'Email',
                      initialValue: 'imshuvo97@gmail.com',
                      suffixIcon:
                          const Icon(Icons.check, color: Color(0xFF53B175)),
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                      label: 'Password',
                      obscureText: !_isPasswordVisible,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0xFF7C7C7C),
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: const Color(0xFF7C7C7C),
                          height: 1.5,
                        ),
                        children: [
                          const TextSpan(text: 'By continuing you agree to our '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: const TextStyle(color: Color(0xFF53B175)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Terms of Service tap
                              },
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: const TextStyle(color: Color(0xFF53B175)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle Privacy Policy tap
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.go('/select_location');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF53B175),
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                        ),
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF030303),
                          ),
                          children: [
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Log In',
                              style: const TextStyle(
                                color: Color(0xFF53B175),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push('/log_in');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? initialValue,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      initialValue: initialValue,
      obscureText: obscureText,
      style: GoogleFonts.lato(
        color: const Color(0xFF030303),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.lato(
          color: const Color(0xFF7C7C7C),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E2E2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF53B175)),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}