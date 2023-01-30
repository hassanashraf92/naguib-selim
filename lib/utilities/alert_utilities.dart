import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/AlertDialog.dart';
import '../main.dart';

class AlertUtilities {
  static Future showError(String message) async {
    BuildContext? context = navigatorKey.currentState?.overlay?.context;
    print("context is here..");
    if (context != null) {
      print("context is inside here..");
      // FocusScope.of(context).unfocus();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorDialog(message: message);
        },
      );
    }
  }
}
