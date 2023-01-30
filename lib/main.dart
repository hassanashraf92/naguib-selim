import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/screens/forgot_password_page.dart';
import 'package:naguib_selim/ui/screens/register_page.dart';

void main() => runApp(MyApp());

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => RegisterPage(),
      },
    );
  }
}
