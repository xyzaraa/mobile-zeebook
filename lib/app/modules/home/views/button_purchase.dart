import 'package:flutter/material.dart';

class ButtonPurchase extends StatelessWidget {
  final void Function() onPressed;

  ButtonPurchase({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          "Purchase Rp139.000",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
