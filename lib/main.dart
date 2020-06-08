import 'package:cart/drawer/drawer_wrapper.dart';
import 'package:cart/screens/login_screen.dart';
import 'package:cart/services/authservice.dart';
import 'package:cart/utilities/router.dart' as router;
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Ecommerce',
    theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        accentColor: Colors.white,
        primaryColorDark: Colors.deepOrange.shade700),
    onGenerateRoute: router.generateRoute,
    home: _handleWindowDisplay(),
  ));
}

Widget _handleWindowDisplay() {
  return StreamBuilder(
      stream: AuthService().authstate,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrange[900]))),
          );
        } else {
          if (snapshot.hasData)
            return DrawerWrapper();
          else
            return LoginScreen();
        }
      });
}
