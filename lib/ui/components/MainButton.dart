import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.buttonText,
    required this.buttonAction,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size.fromHeight(50),
      ),
      child: Text(
        buttonText,
      ),
    );
  }
}
