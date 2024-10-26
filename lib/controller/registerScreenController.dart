import 'package:cash_book/views/loginScreen/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connect_to_sql_server_directly/connect_to_sql_server_directly.dart';

class RegisterScreenController with ChangeNotifier {
  final _connectToSqlServerDirectlyPlugin = ConnectToSqlServerDirectly();
  bool isLoading = false;
  late var isConnected;
  Future<void> submitForm(
    String companyName,
    String username,
    String address,
    String phone,
    String password,
    BuildContext context,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('companyName', companyName);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('address', address);
    await prefs.setString('phone', phone);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }





  Future<bool> sqlconnect() async {
    try {
      isLoading = true;
      notifyListeners();

      isConnected =
          await _connectToSqlServerDirectlyPlugin.initializeConnection(
        "192.168.0.175",
        "Acompany",
        "sa",
        "Mlp09*&okn",
      );

      isLoading = false;
      notifyListeners();

      if (isConnected) {
        print('Database connection successful');
        return true;
      } else {
        print('Database connection failed');
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print('Error during database connection: $e');
      return false;
    }
    
  }
  Future<void> saveData(String companyName,String username,String address,String phone,String password) async {
    if(isConnected =
          await _connectToSqlServerDirectlyPlugin.initializeConnection(
        "192.168.0.175",
        "Acompany",
        "sa",
        "Mlp09*&okn",
      ))  {
      
        try {
          _connectToSqlServerDirectlyPlugin
              .getStatusOfQueryResult(
                   "Insert Into dbo.company(company_name,address,username,password,phone) Values('$companyName','$address','$username','$password','$phone')"
                  )
              .then((value) {
            if (value.runtimeType == String) {
              print(value.toString());
            } 
          });
        } catch (error) {
          print(error.toString());
        }
      } else {
        print('Failed to Register!');
      }
    }
   
  }
  

