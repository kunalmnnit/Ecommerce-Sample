import 'package:cart/components/category_list_view.dart';
import 'package:cart/components/offer_carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => print('Search pressed'),
            splashColor: Colors.white10,
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => print('Cart Pressed'),
            splashColor: Colors.white10,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          OffersCarousel(),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints: BoxConstraints(
                minWidth: 50, maxWidth: 50, minHeight: 30, maxHeight: 30),
            child: Card(
              color: Colors.deepOrange.shade300,
              elevation: 10,
              child: Center(
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          CategoryList(),
        ],
      ),
    );
  }
}
