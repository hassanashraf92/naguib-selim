import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:pinput/pinput.dart';

import '../../base/base_state.dart';

class ActivationPage extends StatefulWidget {
  final String emailAddress;
  const ActivationPage(this.emailAddress, {super.key});

  @override
  _ActivationPageState createState() => _ActivationPageState();
}

class _ActivationPageState extends BaseState<ActivationPage> {
  final TextEditingController activationController = TextEditingController();
  final _pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    _pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _continueButtonPressed() {
    print("Continue button pressed.");
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
              Text(
                widget.emailAddress,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Pinput(
                autofocus: true,
                controller: _pinController,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 12,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.black,
                      )),
                ),
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
