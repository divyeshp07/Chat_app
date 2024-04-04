// import 'package:chat_app/core/extension/app_sizes.dart';
// import 'package:flutter/material.dart';

// class Signuptextfeildwidget extends StatelessWidget {
//   final String labaltext;
//   final IconData prefixicon;
//   final bool obturetext;

//   const Signuptextfeildwidget({
//     super.key,
//     required this.labaltext,
//     required this.prefixicon,
//     this.obturetext = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: context.width(0.78),
//       height: context.height(.1 * 2 / 3),
//       child: TextField(
//         obscureText: obturetext,
//         decoration: InputDecoration(
//           labelText: labaltext,
//           labelStyle: const TextStyle(
//             color: Colors.black,
//           ),
//           filled: true,
//           fillColor: Colors.white.withOpacity(0.5),
//           // contentPadding: EdgeInsets.symmetric(
//           //   vertical: 0,
//           // ),
//           prefixIcon: Icon(
//             prefixicon,
//             color: Colors.black,
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SignupTextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const SignupTextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.78,
      height: MediaQuery.of(context).size.height * 0.1 * 2 / 3,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.5),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
