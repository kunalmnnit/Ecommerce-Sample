import 'package:cart/Drawer/drawer_wrapper.dart';
import 'package:cart/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return user != null ? DrawerWrapper() : LoginScreen();
  }
}
