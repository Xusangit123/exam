import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
// CustomTextField faylini bu yerda import qiling
// import 'path_to_your_custom_text_field.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen({super.key});

  @override
  State<LoginPasswordScreen> createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 3),

                  // "Log in" sarlavhasi
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Log in',
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
                      children: [
                        
                        // Foydalanuvchi ma'lumotlari qatori (Avatar, Name, Email, Check)
                        Row(
                          children: [
                            // Dumaloq Profil Rasmi (Avatar)
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('assets/images/john_doe.jpg'), // Profil rasmi
                            ),
                            const SizedBox(width: 16),
                            
                            // Ism va Email
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'john.doe@example.com',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            
                            // Yashil tasdiq belgisi (Checked icon)
                            const Icon(
                              Icons.check_circle_outline,
                              color: Color(0xFFD0E7C5), // Och yashil rang
                              size: 24,
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        // Siz yaratgan CustomTextField vidjeti (Password)
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                          isPassword: true, // Parol ko'rinishini faollashtiradi (ko'zcha)
                          fillColor: const Color(0xFFEDF4F2),
                          styleColor: Colors.black87,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Iltimos, parolingizni kiriting';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Continue Tugmasi
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Tizimga kirish logikasi shu yerga yoziladi
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
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Forgot password? havolasi
                        TextButton(
                          onPressed: () {
                            // Parolni tiklash ekraniga o'tish
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color(0xFFD0E7C5),
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
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