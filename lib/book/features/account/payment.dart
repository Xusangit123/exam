import 'package:firebase/book/features/account/add_payment.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedCardIndex = 0;
  final List<Map<String, String>> _cards = [
    {"type": "Visa", "number": "**** 4322", "date": "07/2022"},
    {"type": "MC", "number": "**** 1234", "date": "07/2022"},
    {"type": "MC", "number": "**** 1234", "date": "07/2022"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Payment", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                OutlinedButton.icon(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymentMethodScreen())),
                  icon: const Icon(Icons.add, color: Colors.white, size: 16),
                  label: const Text("Add a card", style: TextStyle(color: Colors.white)),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white30)),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  final isDefault = _selectedCardIndex == index;
                  final card = _cards[index];
                  return GestureDetector(
                    onTap: () => setState(() => _selectedCardIndex = index),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDefault ? const Color(0xffd1e7dd) : const Color(0xff1e1f22),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(card["type"]!, style: TextStyle(color: isDefault ? Colors.black : Colors.white, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 16),
                          Expanded(child: Text("${card["number"]}  ${card["date"]}", style: TextStyle(color: isDefault ? Colors.black87 : Colors.grey))),
                          if (isDefault) ...[
                            const Text("Default ", style: TextStyle(color: Colors.black, fontSize: 12)),
                            const Icon(Icons.check_circle, color: Colors.black, size: 20)
                          ] else
                            const Icon(Icons.radio_button_off, color: Colors.white, size: 20),
                          const SizedBox(width: 12),
                          Icon(Icons.delete_outline, color: isDefault ? Colors.black : Colors.white),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPaymentMethodScreen())),
                icon: const Icon(Icons.add_circle_outline, color: Colors.black),
                label: const Text("Add New Payment Method", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffd1e7dd), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              ),
            )
          ],
        ),
      ),
    );
  }
}