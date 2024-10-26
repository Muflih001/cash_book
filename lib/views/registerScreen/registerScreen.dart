import 'package:cash_book/controller/registerScreenController.dart';
import 'package:cash_book/utils/colorConstant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
                    'Sign Up',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          print('login button clicked');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: ColorConstants.Themecolor,
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
                          child: Text('Company Name', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _companyNameController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
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
                        const SizedBox(height: 15),

                        // Address Field

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
                        const SizedBox(
                          height: 15,
                        ),

                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Address', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
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
                        const SizedBox(height: 15),

                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Phone Number', style: TextStyle()),
                        ),
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
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
                        const SizedBox(height: 15),
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
                          obscureText: !isPasswordVisible,
                          validator: (value) {
                            if (value != null && value.length >= 8) {
                              return null;
                            } else {
                              return 'Password must containe atleast 8 character';
                            }
                          },
                        ),

                        const SizedBox(height: 30),

                        InkWell(
                          onTap: () {
                            context.read<RegisterScreenController>().submitForm(
                                _companyNameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _addressController.text,
                                _phoneNumberController.text,
                                context);
                            context.read<RegisterScreenController>().saveData(
                                  _companyNameController.text,
                                  _addressController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                  _phoneNumberController.text,
                                );
                            print('login button clicked');
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorConstants.Themecolor),
                            child: Center(
                                child: isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text(
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
