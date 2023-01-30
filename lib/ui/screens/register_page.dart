import 'package:flutter/material.dart';
import 'package:naguib_selim/base/base_state.dart';
import 'package:naguib_selim/presenter/auth_presenter.dart';
import 'package:naguib_selim/ui/components/AlertDialog.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:naguib_selim/ui/screens/forgot_password_page.dart';
import 'package:naguib_selim/utilities/alert_utilities.dart';

import '../../utilities/text_field_utilities.dart';
import '../components/TextFieldWithPrefixIcon.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

enum RegistrationType { b2c, b2b }

class _RegisterPageState extends BaseState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  RegistrationType _site = RegistrationType.b2c;
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();
  final b2bNumberTextFieldController = TextEditingController();
  bool isB2BNumberTextFieldVisible = false;

  // Future<void> _showErrorDialog(String message) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return ErrorDialog(
  //         message: message,
  //       );
  //     },
  //   );
  // }

  void registerButtonPressed() async {
    if (TextFieldUtilities().validName(nameTextFieldController.text) == false) {
      AlertUtilities.showError("Please enter a valid name.");
      // _showErrorDialog("Please enter a valid name.");
      return;
    }

    if (TextFieldUtilities().validEmail(emailTextFieldController.text) ==
        false) {
      AlertUtilities.showError("Please enter a valid email.");
      return;
    }

    if (TextFieldUtilities().validPhoneNumber(phoneTextFieldController.text) ==
        false) {
      AlertUtilities.showError("Please enter a valid phone number.");
      return;
    }

    if (TextFieldUtilities().validPassword(passwordTextFieldController.text) ==
        false) {
      AlertUtilities.showError("Password should be at least 6 characters.");
      return;
    }

    if (TextFieldUtilities()
            .validPassword(confirmPasswordTextFieldController.text) ==
        false) {
      AlertUtilities.showError(
          "Confirm password should be at least 6 characters.");
      return;
    }

    if (passwordTextFieldController.text !=
        confirmPasswordTextFieldController.text) {
      AlertUtilities.showError("Password mismatch!");
      return;
    }

    _continueButtonPressed();
  }

  Future<void> _continueButtonPressed() async {
    bool success = await AuthPresenter(this).register(
      nameTextFieldController.text,
      RegistrationType.b2c.toString(),
      phoneTextFieldController.text,
      phoneTextFieldController.text,
      emailTextFieldController.text,
      passwordTextFieldController.text,
    );

    print(success);

    if (success) {
      setState(() {
        isB2BNumberTextFieldVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 8, 50, 8),
                child: Image.asset(
                  "assets/logo-icon.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldWithPrefixIcon(
              placeholder: "Full name",
              icon: Icons.person_outline,
              inputType: TextInputType.name,
              controller: nameTextFieldController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldWithPrefixIcon(
              placeholder: "Email address",
              icon: Icons.email_outlined,
              inputType: TextInputType.emailAddress,
              controller: emailTextFieldController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldWithPrefixIcon(
              placeholder: "Phone number",
              icon: Icons.phone_outlined,
              inputType: TextInputType.phone,
              controller: phoneTextFieldController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldWithPrefixIcon(
              placeholder: "Password",
              icon: Icons.password_outlined,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
              controller: passwordTextFieldController,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldWithPrefixIcon(
              placeholder: "Confirm Password",
              icon: Icons.password_outlined,
              inputType: TextInputType.visiblePassword,
              isPassword: true,
              controller: confirmPasswordTextFieldController,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: RegistrationType.b2c,
                        groupValue: _site,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (RegistrationType? value) {
                          setState(() {
                            _site = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text('Person'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Radio(
                        value: RegistrationType.b2b,
                        groupValue: _site,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        onChanged: (RegistrationType? value) {
                          setState(() {
                            _site = value!;
                          });
                        },
                      ),
                      const Expanded(
                        child: Text('Company'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              maintainSize: false,
              maintainAnimation: true,
              maintainState: true,
              visible: isB2BNumberTextFieldVisible,
              child: TextFieldWithPrefixIcon(
                placeholder: "B2B Number",
                icon: Icons.numbers_outlined,
                inputType: TextInputType.number,
                controller: b2bNumberTextFieldController,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            MainButton(
              buttonText: "Register",
              buttonAction: registerButtonPressed,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Already have an account?",
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Text Color
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Login",
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
