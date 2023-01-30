import 'package:flutter/material.dart';
import 'package:naguib_selim/base/base_view.dart';
import 'package:naguib_selim/ui/components/AlertDialog.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>
    implements BaseView {
  // LoadingDialog loadingDialog =
  // new LoadingDialog(); //TODO: Change to ProgressDialog Later.
  // TextUtils textUtils = new TextUtils();

  @override
  void hideProgress() {
    // loadingDialog.hide();
    print("Should hide loading");
  }

  @override
  void showProgress() {
    print("Should show loading");
    // loadingDialog.show();
  }

  @override
  void showSuccessMsg(String msg) {
    // Utils.showSuccessSnackbar(msg);
  }

  @override
  void showErrorMsg(String msg) {
    // Utils.showErrorSnackbar(msg);
  }

  @override
  void showCustomAlert(String msg) {
    Future<void> _showErrorDialog(String message) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ErrorDialog(
            message: message,
          );
        },
      );
    }
  }

  void changeLanguage(String lang) {
    // AppCache.getInstance().setLocale(lang);
    // EasyLocalizationProvider.of(context).data.changeLocale(Locale(lang));
    // Navigator.of(context).pushReplacementNamed('/');
  }
}
