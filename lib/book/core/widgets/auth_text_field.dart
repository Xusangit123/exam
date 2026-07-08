import 'package:flutter/material.dart';

class DarkAuthScreen extends StatefulWidget {
  const DarkAuthScreen({Key? key}) : super(key: key);

  @override
  State<DarkAuthScreen> createState() => _DarkAuthScreenState();
}

class _DarkAuthScreenState extends State<DarkAuthScreen> {
  // Form holatini tekshirish uchun kalit
  final _formKey = GlobalKey<FormState>();

  // Tekshiruvchi controllerlar
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Parol ko'rinishini boshqarish
  bool _isPasswordObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Kirish tugmasi bosilganda ishlovchi funksiya
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Validatsiyadan muvaffaqiyatli o'tganda bajariladigan qism
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tizimga kirilmoqda...')),
      );
    }
  }

  // Rasmga mos takrorlanuvchi InputDecoration dizayni
  InputDecoration _buildInputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
      filled: true,
      fillColor: const Color(0xff1e1e1e), // Rasmga mos to'q fon
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      suffixIcon: suffixIcon,
      
      // Standart holat (Yupqa kulrang chegara)
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[800]!, width: 1.0),
      ),
      // Aktiv holat (Ustiga bosilganda ko'k rang)
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.blue, width: 1.5),
      ),
      // Xatolik holati (Rasmda ko'rsatilganidek qizil chegara)
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212), // Umumiy orqa fon ranggi
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tizimga kirish",
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),

                  // --- EMAIL SECTION ---
                  const Text(
                    "Email text here",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    decoration: _buildInputDecoration(hintText: "Placeholder"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Helper text here: Email kiritilishi shart!";
                      }
                      // Email to'g'riligini tekshiruvchi Regex
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value.trim())) {
                        return "Helper text here: Noto'g'ri email formati!";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // --- PASSWORD SECTION ---
                  const Text(
                    "Password text here",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: _isPasswordObscure,
                    decoration: _buildInputDecoration(
                      hintText: "Placeholder",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: Colors.grey,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordObscure = !_isPasswordObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Helper text here: Parol kiritilishi shart!";
                      }
                      if (value.length < 6) {
                        return "Helper text here: Parol kamida 6 belgidan iborat bo'lsin!";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 12),

                  // --- FORGOT PASSWORD ---
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Parolni tiklash sahifasiga o'tish kodi shu yerga yoziladi
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Parolni tiklash sahifasiga o\'tish')),
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // --- SUBMIT BUTTON ---
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _submit,
                      child: const Text(
                        "Kirish",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}