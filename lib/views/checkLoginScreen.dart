import 'package:cash_book/views/homeScreen/homeScreen.dart';
import 'package:cash_book/views/registerScreen/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data == true) {
            return HomeScreen(); // Navigate to HomeScreen if logged in
          } else {
            return LoginScreen(); // Navigate to LoginScreen if not logged in
          }
        }
      },
    );
  }

  Future<bool> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false; // Return login status
  }
}