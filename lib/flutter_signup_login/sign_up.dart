import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
// final _emailController = TextEditingController();
  //  final _passwordController = TextEditingController();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //Ideal time to initialize
//  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
// //...
// FirebaseAuth.instance.authStateChanges().listen((User? user) {
//   if(user == null) {
//     print('User is currently signed out!');
//   }else{
//     print("User is signed in!");
//   }
//  });
}

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
CollectionReference crad =FirebaseFirestore.instance.collection('crad');
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
                "Sign Up",
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Email',
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

          //TextButton(onPressed: () {}, child: const Text("Forgot Password")),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: (){
                 _firebaseAuth.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text).then((crad) {
                    FirebaseFirestore.instance.collection(
                        'signup'
                    ).doc(crad.user?.uid).set({"email": crad.user?.email});
                });
              },
              child: const Text("SignUp"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Do you a have account"),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Login in",
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
