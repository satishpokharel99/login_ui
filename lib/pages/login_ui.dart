import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  final _formkey = GlobalKey<FormState>();
  bool? _isObscured;
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
        body: Stack(
          children: [
            Image.asset('assets/images/background.png'),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Image.asset('assets/images/background.png'),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Please enter your details to Login",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                    ).hasMatch(value!);

                                    if (value.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    if (!emailValid) {
                                      return "Email format test@doman.com";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintText: "Enter yout email.",
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your password.";
                                    }
                                    return null;
                                  },
                                  obscureText: _isObscured ?? false,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter your password.",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscured = !(_isObscured ?? false);
                                        });
                                      },
                                      icon:
                                          _isObscured ?? false
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off),
                                    ),
                                  ),
                                ),

                                // -------- input fields end here ---------------
                                Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  spacing: 50,
                                  children: [
                                    Row(
                                      // spacing: -9,
                                      children: [
                                        Checkbox(
                                          value: checkboxIsChecked,
                                          onChanged: (value) {
                                            setState(() {
                                              checkboxIsChecked =
                                                  !checkboxIsChecked;
                                            });
                                          },
                                        ),
                                        Text("Remember me"),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[300],
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Processing Data'),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text("Login"),
                                  ),
                                ),
                                // SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Didn't have an account yet."),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/signup');
                                      },
                                      child: Text(
                                        "Sign Up?",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                //Divider here
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text("|OR|"),
                                    Expanded(
                                      child: Divider(
                                        height: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),

                                //Other sign in methods
                                SizedBox(height: 20),
                                Row(
                                  spacing: 35,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/images/icons/fb.png",
                                        width: 40,
                                      ),
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
          ],
        ),
      ),
    );
  }
}
