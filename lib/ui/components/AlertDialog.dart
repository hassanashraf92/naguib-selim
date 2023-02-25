import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';

enum AlertType { success, error }

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.type,
    required this.message,
    required this.actionButtonText,
    required this.actionBlock,
  }) : super(key: key);

  final AlertType type;
  final String message;
  final String actionButtonText;
  final VoidCallback actionBlock;

  String _setAlerImage() {
    String _imageName = "";

    if (type == AlertType.success) {
      _imageName = "assets/success_icon.png";
    } else {
      _imageName = "assets/error_icon.png";
    }

    return _imageName;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(
                  _setAlerImage(),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(message),
              const SizedBox(
                height: 32,
              ),
              Container(
                height: 40,
                child: MainButton(
                  buttonText: actionButtonText,
                  buttonAction: actionBlock,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
