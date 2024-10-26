import 'package:cash_book/controller/homeScreenController.dart';
import 'package:cash_book/utils/colorConstant.dart';
import 'package:cash_book/views/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color:ColorConstants.Themecolor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Log Out'),
              onTap: () {
                context.read<HomeScreenController>().logOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
            ),
          ],
        ),
      );
  }
}