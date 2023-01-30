import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:naguib_selim/ui/components/TextFieldWithPrefixIcon.dart';
import 'package:naguib_selim/ui/screens/activation_page.dart';
import 'package:naguib_selim/utilities/alert_utilities.dart';
import 'package:naguib_selim/utilities/text_field_utilities.dart';
import '../../base/base_state.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends BaseState<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  void _continueButtonPressed() async {
    // if (TextFieldUtilities().validEmail(emailController.text) == false) {
    //   AlertUtilities.showError("Please enter a valid email");
    //   return;
    // }

    print("Continue button pressed.");
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ActivationPage(emailController.text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black, // Text Color
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
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
                height: 30,
              ),
              const Text(
                "Please enter your email address to receive a verification code",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWithPrefixIcon(
                placeholder: "Email address",
                icon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              MainButton(
                buttonText: "Send",
                buttonAction: _continueButtonPressed,
              ),
            ],
          )),
    );
  }
}
