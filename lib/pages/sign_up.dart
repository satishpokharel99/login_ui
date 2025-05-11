import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  String _password = '';
  var _isObscured;
  late bool checkboxIsChecked;

  @override
  void initState() {
    super.initState();

    _isObscured = true;
    checkboxIsChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/background.png'),
              Column(
                children: [
                  Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Please enter your details to Sign up",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // textAlign: TextAlign.left,
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              }

                              final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(value);

                              if (!emailValid) {
                                return "Email format test@doman.com";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              hintText: "Enter your email",
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              }
                              if (value.length < 8) {
                                return "Password length must exceed 8 digits";
                              }
                              _password = value;
                              return null;
                            },
                            obscureText: _isObscured,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon:
                                    _isObscured
                                        ? (Icon(Icons.visibility_off))
                                        : (Icon(Icons.visibility)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter your password",
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value != _password) {
                                return "Password didnot match";
                              }
                              if (value == null || value.isEmpty) {
                                return "Please re enter your password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                                icon:
                                    _isObscured
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Confirm your password",
                            ),
                          ),

                          Row(
                            children: [
                              Checkbox(
                                value: checkboxIsChecked,
                                onChanged: (value) {
                                  setState(() {
                                    checkboxIsChecked = !checkboxIsChecked;
                                  });
                                },
                              ),
                              Text("I accept the terms & conditions"),
                            ],
                          ),

                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Processing data"),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          //Divider here
                          Row(
                            children: [
                              Expanded(
                                child: Divider(height: 1, color: Colors.black),
                              ),
                              Text("|OR|"),
                              Expanded(
                                child: Divider(height: 1, color: Colors.black),
                              ),
                            ],
                          ),

                          //Other sign in methods
                          SizedBox(height: 20),
                          Row(
                            spacing: 35,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/icons/fb.png",
                                width: 40,
                              ),
                              Image.asset(
                                "assets/images/icons/google.png",
                                width: 40,
                              ),
                              Image.asset(
                                "assets/images/icons/x.png",
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
