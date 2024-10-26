import 'package:cash_book/controller/homeScreenController.dart';
import 'package:cash_book/controller/loginScreenController.dart';
import 'package:cash_book/controller/registerScreenController.dart';
import 'package:cash_book/views/checkLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterScreenController(),
        )
      ],
      child: MaterialApp(
        home: CheckLoginScreen(),
      ),
    );
  }
}
