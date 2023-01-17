import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final String username;
  final String email;
  final String password;
   const SignUpScreen({super.key, required this.username, required this.email, required this.password});

  // TextEditingController _userNameTextController = TextEditingController();
  // TextEditingController _emailTextController = TextEditingController();
  // TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference signup = FirebaseFirestore.instance.collection('signup');
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     title: const Text(
    //       "Sign Up",
    //       style: TextStyle(color: Colors.white),
    //     ),
    //   ),
    //   body: Container(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     decoration: BoxDecoration(
    //         gradient: LinearGradient(colors: [
    //           hexStringToColor("CB2B93"),
    //           hexStringToColor("9546C4"),
    //           hexStringToColor("5E61F4")
    //         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    //     child: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
    //         child: Column(
    //           children: <Widget>[
    //             Future<void> addUser{
    //             return signup.add({
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             reusableTextField("Enter Username", Icons.person_outline, false,
    //                 'username': username,
    //         ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             reusableTextField("Enter Email ID", Icons.person_outline, false,
    //                 "email": email,
    //                 ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             reusableTextField("Enter Password", Icons.lock_outlined, true,
    //                 "password": password,
    //         ),
    //             const SizedBox(
    //               height: 20,
    //             ),
    //             signInSignUpButton(context, false, () {
    //               FirebaseAuth.instance
    //                   .createUserWithEmailAndPassword(
    //                   email: _emailTextController.text,
    //                   password: _passwordTextController.text)
    //                   .then((value) {
    //                 print("Created new account successfully");
    //                 Navigator.push(context,
    //                     MaterialPageRoute(builder: (context) => const SignUpScreen()));
    //               }).onError((error, stackTrace) {
    //                 print("Error ${error.toString()}");
    //               });
    //             })
    //               })
    //             }
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    Future<void> SignUpScreen() {
      // Call the user's CollectionReference to add a new user
      return signup.add({
            'username': username, // John Doe
            'email': email, // Stokes and Sons
            'password': password // 42
          })
          .then((value) => print("User Added successfully"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return ElevatedButton(
      onPressed: SignUpScreen,
      child: const Text(
        "Add User",
      ),
    );
  }

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty('username', username));
}
