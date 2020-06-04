import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://www.earticleblog.com/wp-content/uploads/2016/08/airtel-hanset-special-offers.png',
  'https://cdn.grabon.in/gograbon/images/web-images/uploads/1563948052223/Friendship-day-offers.jpg',
  'https://www.sutexbank.in/upload/services/Special_offers.jpg',
  'https://nurserylive.com/images/stories/virtuemart/category/nurserylive-offers.png'
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce'),
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: mediaQuery.size.height * 0.3,
              autoPlay: false,
              aspectRatio: 16 / 9,
              autoPlayAnimationDuration: Duration(microseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
            items: imgList
                .map((item) => Container(
                      child: Card(
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000)),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
