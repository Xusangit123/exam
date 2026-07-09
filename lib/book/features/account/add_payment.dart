import 'package:firebase/book/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

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
            const Text("Add payment method", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Unlimited insights from books, courses, documentaries, and podcasts.", style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 32),
            const CustomTextField(hintText: "Card number", keyboardType: TextInputType.number),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Cardholder name"),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: CustomTextField(hintText: "CVV", keyboardType: TextInputType.number)),
                SizedBox(width: 16),
                Expanded(child: CustomTextField(hintText: "MM/YY", keyboardType: TextInputType.datetime)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Karta muvaffaqiyatli qo'shildi!")));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff687864), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                child: const Text("Add Payment Method", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}