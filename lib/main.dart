import 'package:flutter/material.dart';

import 'Screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        // fontFamily: GoogleFonts.varelaRound().toString(),
        primaryColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.orange,
            ),
      ),
      home: const SignIn(),
    );
  }
}
