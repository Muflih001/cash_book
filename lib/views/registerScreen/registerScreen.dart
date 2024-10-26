import 'package:cash_book/views/registerScreen/loginScreen/loginScreen.dart';
//import 'package:connect_to_sql_server_directly/connect_to_sql_server_directly.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool rememberMe = false;
  bool isPasswordVisible = false;
  //final _connectToSqlServerDirectlyPlugin = ConnectToSqlServerDirectly();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late var isConnected;
  // Future<bool> connect() async {
  //   try {
  //     setState(() {
  //       isLoading = true;
  //     });

  //     isConnected =
  //         await _connectToSqlServerDirectlyPlugin.initializeConnection(
  //       "192.168.0.175",
  //       "Acompany",
  //       "sa",
  //       "Mlp09*&okn",
  //     );

  //     setState(() {
  //       isLoading = false;
  //     });

  //     if (isConnected) {
  //       print('Database connection successful');
  //       return true;
  //     } else {
  //       print('Database connection failed');
  //       return false;
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     print('Error during database connection: $e');
  //     return false;
  //   }
  // }

  // @override
  // void initState() {
  //   connect();
  //   super.initState();
  // }

  // Method to validate and submit the form
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String companyName = _companyNameController.text;
      String username = _emailController.text;
      String address = _addressController.text;
      String phone = _phoneNumberController.text;
      String password = _passwordController.text;
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid username or Password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 71, 161),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          print('create button clicked');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 71, 161),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Company Name', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _companyNameController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your company name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        // Address Field

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'enter a valid email';
                            } else if (value.contains('@')) {
                              return null;
                            } else {
                              return 'invalid email adrees';
                            }
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Address', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),

                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Phone Number', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Password',
                            style: TextStyle(),
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            focusColor: Colors.grey,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible =
                                      !isPasswordVisible; // Toggle the state
                                });
                              },
                            ),
                          ),
                          obscureText: !isPasswordVisible,
                          validator: (value) {
                            if (value != null && value.length >= 8) {
                              return null;
                            } else {
                              return 'Password must containe atleast 8 character';
                            }
                          },
                        ),

                        SizedBox(height: 30),

                        InkWell(
                          onTap: () {
                            _submitForm();
                            print('login button clicked');
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 13, 71, 161)),
                            child: Center(
                                child: isLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
