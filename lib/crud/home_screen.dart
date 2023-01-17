import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

late User loggedInUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final _auth = FirebaseAuth.instance;
@override
  void initState(){
  super.initState();
  getCurrentUser();

}
//using this function you can use the credentials of the user
  void getCurrentUser() async{
  try{
    final user = _auth.currentUser;
    if(user != null) {
      loggedInUser = user;
    }
  }catch (e){
    if (kDebugMode) {
      print(e);
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(onPressed: (){
            _auth.signOut();
            Navigator.pop(context);
          }, icon: const Icon(Icons.close))
        ],
        title: const Text("Home Page"),
        backgroundColor: Colors.lightBlueAccent,
      ),body: const Center(
      child: Text("Welcome user",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    ),
    );
  }
}
