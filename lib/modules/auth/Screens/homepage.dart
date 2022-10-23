import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text('Hello'),
            ),
            Center(
              child: Text('Signed in as: ${user.email}'),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, 'Login');
                print('Signed in as after logout: ${user.email}');
              },
              child: Text('LogOut'),
            ),
          ],
        ),
      ),
    );
  }
}
