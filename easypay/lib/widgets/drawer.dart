import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _CreateHeader(),
          _createDrawerItem(
              icon: Icons.settings, text: 'Settings', onTap: () {})
        ],
      ),
    );
  }
}

// Drawer Header
Widget _CreateHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/logo.png'),
        fit: BoxFit.fill,
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            'Eliya Joseph',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
}

// Drawer Items
Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
