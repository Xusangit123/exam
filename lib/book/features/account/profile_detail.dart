import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profile details", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(radius: 50, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 50)),
                      Positioned(
                        bottom: 0, right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(color: Color(0xffd1e7dd), shape: BoxShape.circle),
                          child: const Icon(Icons.upload_file, color: Colors.black, size: 18),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text("Change profile picture", style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const CustomTextField(labelText: "Your Name", hintText: "John Doe", trailingIcon: Icon(Icons.chevron_right)),
            const SizedBox(height: 16),
            const CustomTextField(labelText: "Email", hintText: "john.doe@example.com", trailingIcon: Icon(Icons.chevron_right)),
            const SizedBox(height: 16),
            const CustomTextField(labelText: "Date of Birth", hintText: "23 December, 1972", trailingIcon: Icon(Icons.chevron_right)),
          ],
        ),
      ),
    );
  }
}