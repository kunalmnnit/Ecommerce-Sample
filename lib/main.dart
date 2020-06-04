import 'package:cart/services/authservice.dart';
import 'package:cart/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().authstate,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: ThemeData(
            primaryColor: Colors.deepOrangeAccent,
            accentColor: Colors.white,
            primaryColorDark: Colors.deepOrange.shade700),
        home: Wrapper(),
      ),
    );
  }
}
