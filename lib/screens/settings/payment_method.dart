import 'package:flutter/material.dart';
import 'package:home_mate/constant/colors.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clBG,
      appBar: AppBar(
        backgroundColor: clPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              title: const Text("Cash"),
              trailing: const Icon(
                Icons.payments,
                color: Colors.green,
              ),
              tileColor: clContainer,
              leading: Checkbox(
                value: false,
                onChanged: (value) {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            ListTile(
              onTap: () {},
              title: const Text("Online"),
              trailing: const Icon(
                Icons.currency_exchange,
                color: Colors.green,
              ),
              tileColor: clContainer,
              leading: Checkbox(
                value: false,
                onChanged: (value) {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
