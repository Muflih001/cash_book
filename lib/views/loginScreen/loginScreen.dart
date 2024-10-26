import 'package:cash_book/controller/loginScreenController.dart';
import 'package:cash_book/controller/registerScreenController.dart';
import 'package:cash_book/utils/colorConstant.dart';
import 'package:cash_book/views/homeScreen/homeScreen.dart';
import 'package:cash_book/views/registerScreen/registerScreen.dart';
//import 'package:connect_to_sql_server_directly/connect_to_sql_server_directly.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool rememberMe = false;
  //final _connectToSqlServerDirectlyPlugin = ConnectToSqlServerDirectly();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<RegisterScreenController>().sqlconnect();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.Themecolor,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have a company? ',
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ));
                          print('create button clicked');
                        },
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 71, 161),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Email',
                            style: TextStyle(),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
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
                            contentPadding: const EdgeInsets.symmetric(
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
                          obscureText: isPasswordVisible,
                          validator: (value) {
                            if (value != null && value.length >= 8) {
                              return null;
                            } else {
                              return 'Password must containe atleast 8 character';
                            }
                          },
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value!;
                                });
                              },
                            ),
                            const Text("Rememer me"),
                            const Spacer(),
                            InkWell(
                                onTap: () {
                                  print('forget button clicked');
                                },
                                child: const Text(
                                  "Forgot Password ?",
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginScreenController>().submitForm(
                                  context,
                                  _emailController.text,
                                  _passwordController.text);
                            }
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.Themecolor),
                            child: const Center(
                                child: Text(
                              'Log In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
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
