import 'package:flutter/material.dart';

import 'Screens/signin.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
