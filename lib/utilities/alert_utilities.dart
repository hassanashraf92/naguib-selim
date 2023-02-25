import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/AlertDialog.dart';
import '../main.dart';

class AlertUtilities {
  static Future showError(String message) async {
    BuildContext? context = navigatorKey.currentState?.overlay?.context;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorDialog(
            message: message,
            actionBlock: () {
              Navigator.pop(context);
            },
            actionButtonText: "Ok",
            type: AlertType.error,
          );
        },
      );
    }
  }
}
