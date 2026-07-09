import 'package:flutter/material.dart';

class CreditCardItem extends StatelessWidget {
  final String cardType;
  final String cardNumber;
  final String expiryDate;
  final bool isDefault;
  final VoidCallback onTap; // Karta bosilganda ishlaydi
  final VoidCallback onDelete;

  const CreditCardItem({
    Key? key,
    required this.cardType,
    required this.cardNumber,
    required this.expiryDate,
    required this.isDefault,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = isDefault ? const Color(0xffd1e7dd) : const Color(0xff1e1f22);
    final textColor = isDefault ? Colors.black : Colors.white;

    return InkWell(
      onTap: onTap, // Bosish hodisasi ulandi
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isDefault ? Colors.black12 : Colors.white10,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                cardType.toUpperCase(),
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                children: [
                  Text(
                    cardNumber,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    expiryDate,
                    style: TextStyle(color: isDefault ? Colors.black54 : Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            if (isDefault) ...[
              Text("Default ", style: TextStyle(color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
              Icon(Icons.check_circle, color: textColor, size: 20),
            ] else ...[
              Icon(Icons.radio_button_off, color: textColor, size: 20),
            ],
            const SizedBox(width: 12),
            IconButton(
              icon: Icon(Icons.delete_outline, color: textColor),
              onPressed: onDelete,
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}