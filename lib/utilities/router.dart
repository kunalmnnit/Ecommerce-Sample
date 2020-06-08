import 'package:cart/drawer/drawer_wrapper.dart';
import 'package:cart/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'constanst.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case prodDetails:
      return MaterialPageRoute(
          builder: (context) => ProductDetails(), settings: settings);
    case home:
      return MaterialPageRoute(builder: (context) => DrawerWrapper());
    default:
      return MaterialPageRoute(builder: (context) => DrawerWrapper());
  }
}
