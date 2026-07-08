import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
// CustomTextField faylini bu yerda import qiling
// import 'path_to_your_custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Orqa fon rasmi (Background Image)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jon.jpg'), // Rasm manzili
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          // 2. Qorong'u qatlam (Dark Overlay)
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // 3. Asosiy Kontent
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ekran tepasidan bo'shliq (SizedBox o'rniga dinamik moslashuv uchun)
                    const SizedBox(height: 120),

                    // "Sign up" sarlavhasi
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Forma uchun qorong'u karta (Card Container)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Izoh matni
                          const Text(
                            'Looks like you don’t have an account.\nLet’s create a new account for you.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 24),

                          // 1. Name Field
                          CustomTextField(
                            controller: _nameController,
                            hintText: 'Name',
                            fillColor: const Color(0xFFEDF4F2),
                            styleColor: Colors.black87,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Iltimos, ismingizni kiriting';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // 2. Email Field
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Email',
                            fillColor: const Color(0xFFEDF4F2),
                            styleColor: Colors.black87,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, emailingizni kiriting';
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                                return 'Noto‘g‘ri email formati';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // 3. Password Field (Ko'zcha bilan)
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            isPassword: true, // Parol ko'rinishini faollashtiradi
                            fillColor: const Color(0xFFEDF4F2),
                            styleColor: Colors.black87,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, parol kiriting';
                              }
                              if (value.length < 6) {
                                return 'Parol kamida 6 ta belgidan iborat bo‘lsin';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // Ommaviy oferta va Maxfiylik siyosati matni
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                height: 1.4,
                              ),
                              children: [
                                const TextSpan(text: 'By selecting Create Account below, I agree to '),
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                    color: const Color(0xFFD0E7C5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(text: ' & '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: const Color(0xFFD0E7C5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Create Account Tugmasi
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Ro'yxatdan o'tish logikasi shu yerga yoziladi
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD0E7C5), // Och yashil
                                foregroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Pastki "Log in" qismi
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.grey),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context); // Tizimga kirish ekraniga qaytish
                                },
                                child: const Text(
                                  'Log in',
                                  style: TextStyle(
                                    color: Color(0xFFD0E7C5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}