import 'package:flutter/material.dart';
import 'package:cart/services/authservice.dart';

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
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.deepOrange.shade400,
            height: mediaQuery.size.height * 0.2,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://w0.pngwave.com/png/639/452/computer-icons-avatar-user-profile-people-icon-png-clip-art.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Kunal Sevkani',
                      textWidthBasis: TextWidthBasis.parent,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '+91-7976127003',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.deepOrange.shade400,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.category, color: Colors.deepOrange.shade400),
            title: Text(
              'Categories',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.local_offer,
              color: Colors.deepOrange.shade400,
            ),
            title: Text(
              'Offers',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.deepOrange.shade400,
            ),
            title: Text(
              'About Us',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.deepOrange.shade400,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              AuthService().signOut();
              //Navigator.pushReplacementNamed(context, '/screens/login_screen');
            },
          ),
        ],
      ),
    );
  }
}
