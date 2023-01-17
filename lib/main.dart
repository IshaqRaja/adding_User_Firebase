import 'package:cradentialsfor_app/crud/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'crud/home_screen.dart';
import 'crud/login_screen.dart';
import 'crud/registration_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 // static const String _title = 'My App';
  // This widget is the root of your application.
  @override
  Widget build(context) {
    return MaterialApp(
      title: ("My App"),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home screen',
      routes: {
        'registration screen': (context) => const RegistrationScreen(),
        'welcome screen': (context) => const WelcomeScreen(),
        'login screen': (context) => const LoginScreen(),
        'home screen': (context) => const HomeScreen(),
      },
      // home: const SignUpScreen(),
      // theme: ThemeData(),
    );
  }
}
