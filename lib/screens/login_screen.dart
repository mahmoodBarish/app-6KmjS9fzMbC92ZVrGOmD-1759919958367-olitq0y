import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Images and Effects
          Positioned.fill(
            child: Image.asset(
              'assets/images/244_669.png',
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              'assets/images/244_674.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),

          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    _buildLogo(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    _buildHeaderText(),
                    const SizedBox(height: 40),
                    _buildEmailField(),
                    const SizedBox(height: 30),
                    _buildPasswordField(),
                    const SizedBox(height: 20),
                    _buildForgotPasswordButton(),
                    const SizedBox(height: 30),
                    _buildLoginButton(context),
                    const SizedBox(height: 25),
                    _buildSignupLink(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/244_722.png',
              width: 25,
              height: 22,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/images/244_723.png',
              width: 40,
              height: 45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: GoogleFonts.poppins(
            color: const Color(0xFF181725),
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Enter your email and password',
          style: GoogleFonts.poppins(
            color: const Color(0xFF7C7C7C),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      initialValue: 'imshuvo97@gmail.com',
      keyboardType: TextInputType.emailAddress,
      style: GoogleFonts.poppins(
        color: const Color(0xFF181725),
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF7C7C7C),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E2E2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF53B175)),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      style: GoogleFonts.poppins(
        color: const Color(0xFF181725),
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF7C7C7C),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF7C7C7C),
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE2E2E2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF53B175)),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle forgot password
        },
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.poppins(
            color: const Color(0xFF181725),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/home');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF53B175),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      child: Text(
        'Log In',
        style: GoogleFonts.poppins(
          color: const Color(0xFFFFF9FF),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSignupLink(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.poppins(
            color: const Color(0xFF181725),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          children: [
            const TextSpan(text: 'Don’t have an account? '),
            TextSpan(
              text: 'Signup',
              style: const TextStyle(
                color: Color(0xFF53B175),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.push('/sign_up');
                },
            ),
          ],
        ),
      ),
    );
  }
}