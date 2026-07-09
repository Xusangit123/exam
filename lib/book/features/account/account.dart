import 'package:firebase/book/features/account/payment.dart';
import 'package:firebase/book/features/account/profile_detail.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John Doe", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("john.doe@example.com", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: const Color(0xffd1e7dd), borderRadius: BorderRadius.circular(16)),
                child: const Text("Premium", style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Container(width: 110, height: 3, color: const Color(0xff94e2d5)),
          const SizedBox(height: 24),
          
          _buildMenuItem(Icons.person_outline, "Profile details", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetailsScreen()));
          }),
          _buildMenuItem(Icons.credit_card_outlined, "Payment", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen()));
          }),
          _buildMenuItem(Icons.star_border, "Subscription", () {}),
          const Divider(color: Colors.white10, height: 32),
          _buildMenuItem(Icons.help_outline, "FAQs", () {}),
          _buildMenuItem(Icons.logout, "Logout", () {}, showArrow: false),
          const SizedBox(height: 32),
          
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xff1f2235), borderRadius: BorderRadius.circular(12)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.headset_mic_outlined, color: Color(0xff94e2d5)),
                SizedBox(width: 12),
                Text("Feel free to ask, We are here to help", style: TextStyle(color: Color(0xff94e2d5), fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {bool showArrow = true}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: const Color(0xff1e1f22), borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: const Color(0xff94e2d5)),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
      trailing: showArrow ? const Icon(Icons.chevron_right, color: Colors.white70) : null,
    );
  }
}