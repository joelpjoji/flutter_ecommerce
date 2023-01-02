import 'dart:async';

import 'package:ecommerce/Screens/FeaturedScreen.dart';
import 'package:ecommerce/Screens/HomeScreen.dart';
import 'package:ecommerce/Screens/Login/LoginScreen.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? 'loginscreen'
          : 'HomeScreen',
      routes: {
        'loginscreen': (context) => LoginScreen(),
        'HomeScreen': (context) => HomeScreen(),
        'FeaturedScreen': (context) => FeaturedScreen(),
      },
      home: HomeScreen(),
    );
  }
}
