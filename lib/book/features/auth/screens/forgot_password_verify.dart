import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
// CustomTextField faylini bu yerda import qiling
// import 'path_to_your_custom_text_field.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
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

                  // "Verify Code" sarlavhasi
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Verify Code',
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
                          'An authentication code has been sent to your email.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Tasdiqlash kodini kiritish uchun CustomTextField
                        CustomTextField(
                          controller: _codeController,
                          hintText: 'Enter Code',
                          fillColor: const Color(0xFFEDF4F2),
                          styleColor: Colors.black87,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Iltimos, kodni kiriting';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Verify Tugmasi
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Kodni tekshirish logikasi shu yerga yoziladi
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
                              'Verify',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Kodni qayta yuborish qismi (Resend)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t receive a code? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Kodni qayta yuborish logikasi
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    'Resend ',
                                    style: TextStyle(
                                      color: Color(0xFFD0E7C5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.refresh,
                                    color: Color(0xFFD0E7C5),
                                    size: 16,
                                  ),
                                ],
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