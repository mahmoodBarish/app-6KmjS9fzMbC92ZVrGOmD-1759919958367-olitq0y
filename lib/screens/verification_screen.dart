import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F2),
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset(
                    'assets/images/244_596.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      context.pop();
                    },
                    color: const Color(0xFF181725),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'Enter your 4-digit code',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF181725),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Code',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7C7C7C),
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF181725),
                            letterSpacing: 20,
                          ),
                          decoration: const InputDecoration(
                            counterText: "",
                            hintText: '- - - -',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF181725),
                              letterSpacing: 20,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF53B175)),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Resend Code',
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: const Color(0xFF53B175),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.push('/select_location');
                              },
                              child: Container(
                                width: 67,
                                height: 67,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF53B175),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}