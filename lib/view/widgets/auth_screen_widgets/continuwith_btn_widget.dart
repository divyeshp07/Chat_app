import 'package:chat_app/core/extension/app_sizes.dart';
import 'package:flutter/material.dart';

class AuthScreenContinuewithWidget extends StatelessWidget {
  final Function() onpress;
  final IconData icon;
  final String text;
  final Color? iconcolor;
  final double? iconsize;

  const AuthScreenContinuewithWidget({
    super.key,
    required this.onpress,
    required this.icon,
    required this.text,
    this.iconcolor,
    this.iconsize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width(0.77),
      height: context.height(.1 * 2 / 3),
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.5),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2))),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: iconcolor,
              size: iconsize,
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
