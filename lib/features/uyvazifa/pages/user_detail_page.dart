import 'package:firebase/features/uyvazifa/models/user_model.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(radius: 60, backgroundImage: NetworkImage(user.image)),

            const SizedBox(height: 20),

            Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ListTile(title: const Text("ID"), subtitle: Text(user.id)),
            ListTile(title: const Text("Name"), subtitle: Text(user.name)),

            ListTile(
              title: const Text("Last Name"),
              subtitle: Text(user.lastname),
            ),
            ListTile(title: const Text("City"), subtitle: Text(user.city)),
          ],
        ),
      ),
    );
  }
}
