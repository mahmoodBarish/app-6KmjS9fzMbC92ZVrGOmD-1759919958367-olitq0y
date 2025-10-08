import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF181725),
                      size: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40.0),
                        Text(
                          "Enter your mobile number",
                          style: GoogleFonts.montserrat(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF181725),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Mobile Number",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF7C7C7C),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          keyboardType: TextInputType.phone,
                          autofocus: true,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF181725),
                            letterSpacing: 1.5,
                          ),
                          decoration: InputDecoration(
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 0, minHeight: 0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/244_526.png',
                                    width: 34,
                                    height: 24,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "+880",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF181725),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF53B175), width: 2.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 25,
            child: FloatingActionButton(
              onPressed: () {
                context.push('/verification');
              },
              backgroundColor: const Color(0xFF53B175),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}