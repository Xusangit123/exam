import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
// CustomTextField faylini bu yerda import qiling
// import 'path_to_your_custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
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
          
          // 2. Qorong'u qatlam (Dark Overlay) rasm ustini biroz to'sib matnlarni ko'rsatish uchun
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // 3. Asosiy Kontent
          SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Yuqoridagi "Back to Log in" tugmasi
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context); // Orqaga qaytish funksiyasi
                      },
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                      label: const Text(
                        'Back to Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),

                  // "Recover Password" sarlavhasi
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Recover Password',
                      style: TextStyle(
                        fontSize: 36,
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
                          'Forgot your password? Don’t worry, enter your email to reset your current password.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                        
                        const SizedBox(height: 24),

                        // Siz yaratgan CustomTextField vidjeti
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
                        
                        const SizedBox(height: 20),

                        // Submit Tugmasi (Dizayndagidek xatolik tuzatilib "Submit" deb yozildi)
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Tiklash kodini yuborish logikasi shu yerga yoziladi
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD0E7C5), // Och yashil rang
                              foregroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),

                        // Pastki "Sign up" qismi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don’t have an account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Ro'yxatdan o'tish sahifasiga o'tish
                              },
                              child: const Text(
                                'Sign up',
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
                  
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}