import 'package:flutter/material.dart';
import 'package:cart/drawer/drawer.dart';
import 'package:cart/screens/home_screen.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';

class DrawerWrapper extends StatefulWidget {
  @override
  _DrawerWrapperState createState() => _DrawerWrapperState();
}

class _DrawerWrapperState extends State<DrawerWrapper> {
  FSBStatus status;
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.deepOrange.shade600);
    return SafeArea(
      child: Scaffold(
        body: SwipeDetector(
          onSwipeRight: () {
            setState(() {
              status = FSBStatus.FSB_OPEN;
            });
          },
          onSwipeLeft: () {
            setState(() {
              status = FSBStatus.FSB_CLOSE;
            });
          },
          child: FoldableSidebarBuilder(
            status: status,
            drawer: CustomDrawer(
              closeDrawer: () {
                status = FSBStatus.FSB_CLOSE;
              },
            ),
            screenContents: HomeScreen(),
            drawerBackgroundColor: Colors.deepOrange.shade600,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              status = status == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
          },
          tooltip: 'Menu',
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
