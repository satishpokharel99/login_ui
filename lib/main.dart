import 'package:flutter/material.dart';
import 'package:login_ui/pages/login_ui.dart';
import 'package:login_ui/pages/sign_up.dart';
// import 'package:login_ui/pages/login_ui.dart';
import 'package:login_ui/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const StartPage(),
      routes: {
        '/loginui': (context) => LoginUi(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
