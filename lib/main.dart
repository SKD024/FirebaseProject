import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'modules/auth/Screens/homepage.dart';
import 'modules/auth/Screens/login_page.dart';
import 'modules/auth/Screens/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (ctx) {
          return LoginPage();
        },
        'Register': (ctx) {
          return const RegisterPage();
        },
        'Home': (ctx) {
          return const Homepage();
        },
      },
      initialRoute: 'Login',
    );
  }
}
