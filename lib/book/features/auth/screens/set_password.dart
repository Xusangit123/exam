import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';



class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jon.jpg'), 
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),

          
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          
          SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),

                    
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Set Password',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    
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
                          const SizedBox(height: 8),
                          
                          
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFD0E7C5),
                                width: 3,
                              ),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Color(0xFFD0E7C5),
                              size: 32,
                            ),
                          ),
                          
                          const SizedBox(height: 12),
                          
                          
                          const Text(
                            'Code verified',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 28),

                          
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Enter new password',
                            isPassword: true,
                            fillColor: const Color(0xFFEDF4F2),
                            styleColor: Colors.black87,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, yangi parol kiriting';
                              }
                              if (value.length < 8) {
                                return 'Parol kamida 8 ta belgidan iborat bo‘lishi kerak';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          
                          CustomTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Re-type new password',
                            isPassword: true,
                            fillColor: const Color(0xFFEDF4F2),
                            styleColor: Colors.black87,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Iltimos, parolni qayta kiriting';
                              }
                              if (value != _passwordController.text) {
                                return 'Parollar bir-biriga mos kelmadi';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 8),
                          
                          
                          alignmentLeft(
                            child: const Text(
                              'At-least 8 characters',
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD0E7C5),
                                foregroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Set Password',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
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

  
  Widget alignmentLeft({required Widget child}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: child,
      ),
    );
  }
}