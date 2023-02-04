import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:naguib_selim/ui/components/MainButton.dart';
import 'package:naguib_selim/ui/components/TextFieldWithPrefixIcon.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameTextFieldController = TextEditingController();
  final emailTextFieldController = TextEditingController();
  final phoneTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final confirmPasswordTextFieldController = TextEditingController();
  final b2bNumberTextFieldController = TextEditingController();
  bool isB2BNumberTextFieldVisible = false;

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
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.30),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "HA",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Hassan Ashraf",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: const [
                Text(
                  "Personal Info",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
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
              height: 30,
            ),
            MainButton(
              buttonText: "Register",
              buttonAction: () {},
            ),
          ],
        ),
      ),
    );
  }
}
