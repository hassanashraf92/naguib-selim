import 'package:flutter/material.dart';

class SideMenuListItem extends StatelessWidget {
  const SideMenuListItem({
    Key? key,
    required this.listTitle,
    required this.listIcon,
    required this.listItemTapped,
  }) : super(key: key);

  final String listTitle;
  final IconData listIcon;
  final VoidCallback listItemTapped;
  final Offset listTileOffset = const Offset(-28, 0);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listIcon),
      title: Transform.translate(
        offset: listTileOffset,
        child: Text(
          listTitle,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      onTap: listItemTapped,
    );
  }
}
