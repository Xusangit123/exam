import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final VoidCallback onTap;
  final bool showArrow;

  const ProfileMenuItem({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xff1e1f22), 
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(leadingIcon, color: const Color(0xff94e2d5)),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: showArrow 
          ? const Icon(Icons.chevron_right, color: Colors.white70) 
          : null,
    );
  }
}