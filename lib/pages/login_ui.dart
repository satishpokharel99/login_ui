import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  // final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: Stack(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/background.jpg'),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Positioned.fill(
                child: Image.asset(
                  "/assets/images/background.jpg",
                  fit: BoxFit.cover,
                ),
              ),

              Positioned.fill(
                top: 120,
                left: 90,
                child: Column(
                  children: [
                    Text(
                      "Welcome back",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Please enter your details to Login."),
                  ],
                ),
              ),

              Positioned(
                top: 250,
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
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
