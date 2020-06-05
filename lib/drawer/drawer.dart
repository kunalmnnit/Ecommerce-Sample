import 'package:cart/utilities/constanst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cart/services/authservice.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  final Function closeDrawer;
  CustomDrawer({Key key, this.closeDrawer}) : super(key: key);
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final user = Provider.of<FirebaseUser>(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
                minHeight: mediaQuery.size.height * 0.2,
                minWidth: mediaQuery.size.width * 0.6,
                maxHeight: mediaQuery.size.height * 0.2,
                maxWidth: mediaQuery.size.width * 0.6),
            color: Colors.deepOrange.shade400,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(url),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  user.phoneNumber,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          InkWell(
            splashColor: Colors.deepOrangeAccent,
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.deepOrange.shade400,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () => print('home'),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            splashColor: Colors.deepOrangeAccent,
            child: ListTile(
              leading: Icon(
                Icons.local_offer,
                color: Colors.deepOrange.shade400,
              ),
              title: Text(
                'Offers',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () => print('Offers'),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            splashColor: Colors.deepOrangeAccent,
            child: ListTile(
              leading: Icon(
                Icons.people,
                color: Colors.deepOrange.shade400,
              ),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () => print('About Us'),
          ),
          SizedBox(
            height: 5,
          ),
          InkWell(
            splashColor: Colors.deepOrangeAccent,
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.deepOrange.shade400,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () {
              AuthService().signOut();
            },
          ),
        ],
      ),
    );
  }
}
