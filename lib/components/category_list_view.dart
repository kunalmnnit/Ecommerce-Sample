import 'package:cart/utilities/constanst.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imgurl: laptop,
            imgcaps: 'Laptops',
          ),
          Category(
            imgurl: mobiles,
            imgcaps: 'Mobiles',
          ),
          Category(
            imgurl: books,
            imgcaps: 'Books',
          ),
          Category(
            imgurl: clothes,
            imgcaps: 'Fashion',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imgurl;
  final String imgcaps;

  const Category({this.imgurl, this.imgcaps});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 120,
          child: ListTile(
            title: Image.asset(
              imgurl,
              width: 100,
              height: 100,
              color: Colors.deepOrange.shade200,
            ),
            subtitle: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  imgcaps,
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ),
      ),
    );
  }
}
