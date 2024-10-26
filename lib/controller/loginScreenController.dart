import 'package:cash_book/views/homeScreen/homeScreen.dart';
import 'package:connect_to_sql_server_directly/connect_to_sql_server_directly.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreenController with ChangeNotifier {
  final _connectToSqlServerDirectlyPlugin = ConnectToSqlServerDirectly();
  bool isLoading = false;
  late var isConnected;
  

  Future<void> submitForm(context, String username, password) async {
    isLoading = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('username');
    final storedPassword = prefs.getString('password');
    if (username == storedUsername && password == storedPassword) {
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Invalid username or password'),
        ),
      );
    }

    isLoading = false;
    notifyListeners();
  }
}
