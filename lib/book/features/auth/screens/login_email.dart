import 'package:flutter/material.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({super.key});

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/jon.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          // Dark overlay to blend the image nicely

          // Main UI Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                // Heading "Log in"
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
                // Bottom Form Card Container
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Email Field
                      TextField(
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color(0xFFEDF4F2),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD0E7C5),
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
                      const SizedBox(height: 16),
                      // Forgot Password Link
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Color(0xFFD0E7C5),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // "Or" Divider
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.white24,
                              endIndent: 10,
                            ),
                          ),
                          Text(
                            'Or',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Expanded(
                            child: Divider(color: Colors.white24, indent: 10),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Social Buttons
                      _buildSocialButton(
                        icon: Icons.facebook,
                        text: 'Login with Facebook',
                        iconColor: const Color(0xFF1877F2),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton(
                          
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            
                            backgroundColor: const Color(0xFFEDF4F2),
                            foregroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 8),
                              Image.asset(
                                'assets/images/google_logo.png',
                                width: 24,
                                height: 24,
                              ),
                              const Spacer(flex: 2),
                              Text(
                                'Login with Google',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(flex: 3),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildSocialButton(
                        icon: Icons.apple,
                        text: 'Login with Apple',
                        iconColor: Colors.black,
                      ),
                      const SizedBox(height: 24),
                      // Sign Up Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {},
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
                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required Color iconColor,
    bool isGoogle = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEDF4F2),
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Icon(icon, color: iconColor, size: 29),
            const Spacer(flex: 2),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
