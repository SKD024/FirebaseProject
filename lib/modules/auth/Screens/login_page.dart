import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late User user;
  final auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                "LogIn to your Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  }

                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Enter a valid Email';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return 'Please enter your password.';
                  }

                  if ((value?.length ?? 0 < 8) == true) {
                    return 'Please enter a valid password.';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: obscure,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: signIn,
                  child: const Text('Login'),
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'Register');
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final googleaSignIn = GoogleSignIn(
                  serverClientId:
                      '1006599347408-o65epk13fqmgr5mtr7hrbigvo9ultvun.apps.googleusercontent.com',
                );
                final googleAccount = await googleaSignIn.signIn();
                print('sgoogle sign in : ${googleAccount!.email}');
              },
              child: const Text('Google SignIn'),
            ),
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    user = auth.currentUser!;
    await user.reload();
    Navigator.pushNamed(context, 'Home');
    print(user.email);
  }
}
