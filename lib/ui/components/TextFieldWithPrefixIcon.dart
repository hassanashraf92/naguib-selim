import 'package:flutter/material.dart';

class TextFieldWithPrefixIcon extends StatelessWidget {
  const TextFieldWithPrefixIcon({
    Key? key,
    required this.placeholder,
    required this.icon,
    required this.inputType,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  final String placeholder;
  final IconData icon;
  final TextInputType inputType;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(6.0),
        gradient: const LinearGradient(
          colors: [Color(0xFFEFEFEF), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
          ),
          hintText: placeholder,
        ),
      ),
    );
  }
}
