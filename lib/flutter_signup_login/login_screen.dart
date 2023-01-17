import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();

  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Credentials App",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Sign In",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(onPressed: () {}, child: const Text("Forgot Password")),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () async{
                await _firebaseAuth.signInWithEmailAndPassword(
                    email: nameController.text,
                    password: passwordController.text)
                   .then((value) => print("Login Successfully"));

              },
              child: const Text("Login"),
              onLongPress: () {
                if (kDebugMode) {
                  print(nameController.text);
                }
                if (kDebugMode) {
                  print(passwordController.text);
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Does not have account"),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 20),
                ),
                onLongPress: () {
                  //signup screen
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
