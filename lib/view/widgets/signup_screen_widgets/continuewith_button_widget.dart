import 'package:chat_app/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class ContinuwithbuttonWidget extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function() onpress;
  const ContinuwithbuttonWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0),
          minimumSize: Size(context.width(0.02), context.height(0.06)),
          shape: const BeveledRectangleBorder(
              side: BorderSide(
                width: 0.2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        onPressed: onpress,
        child: Icon(
          icon,
          color: color,
        ));
  }
}
