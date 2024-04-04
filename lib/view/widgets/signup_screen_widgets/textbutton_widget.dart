import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  final Function() onpress;
  final String text;
  final String? text1;
  const TextbuttonWidget({
    super.key,
    required this.onpress,
    required this.text,
    this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            TextSpan(
              text: text1,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                // decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
