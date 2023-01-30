import 'package:flutter/material.dart';
import 'package:naguib_selim/ui/components/SideMenuListItem.dart';
import 'package:naguib_selim/ui/screens/forgot_password_page.dart';

class SideMenuPage extends StatelessWidget {
  final Offset listTileOffset = const Offset(-30, 0);

  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xF7F7F7FF),
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0),
            ),
            accountName: const Text(
              "Hassan Ashraf",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: const Text(""),
            currentAccountPicture: const FlutterLogo(),
          ),
          SideMenuListItem(
            listTitle: "My Orders",
            listIcon: Icons.bookmark_border_outlined,
            listItemTapped: () {
              print("Item Tapped!");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgotPasswordPage(),
                ),
              );
            },
          ),
          SideMenuListItem(
            listTitle: "Settings",
            listIcon: Icons.settings_outlined,
            listItemTapped: () {
              print("Item Tapped!");
            },
          ),
          SideMenuListItem(
            listTitle: "About us",
            listIcon: Icons.info_outline,
            listItemTapped: () {
              print("Item Tapped!");
            },
          ),
          SideMenuListItem(
            listTitle: "Contact us",
            listIcon: Icons.phone_outlined,
            listItemTapped: () {
              print("Item Tapped!");
            },
          ),
          SideMenuListItem(
            listTitle: "Terms & Conditions",
            listIcon: Icons.list_alt_outlined,
            listItemTapped: () {
              print("Item Tapped!");
            },
          ),
          SideMenuListItem(
            listTitle: "English",
            listIcon: Icons.language_outlined,
            listItemTapped: () {
              print("Item Tapped!");
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              minimumSize: MaterialStateProperty.all(
                const Size.fromHeight(40),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.logout_outlined),
                Text(
                  "Logout",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
