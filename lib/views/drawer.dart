import 'package:flutter/material.dart';

class BlogDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Handle home screen navigation
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Category A'),
            onTap: () {
              // Handle Category A navigation
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Category B'),
            onTap: () {
              // Handle Category B navigation
              Navigator.pop(context);
            },
          ),
          // Add more categories here
        ],
      ),
    );
  }
}
