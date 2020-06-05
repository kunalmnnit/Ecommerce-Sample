import 'package:cart/Drawer/drawer_wrapper.dart';
import 'package:cart/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if (user != null)
      return DrawerWrapper();
    else
      return LoginScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
