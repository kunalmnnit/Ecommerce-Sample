import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart/utilities/constanst.dart';
import 'package:flutter/material.dart';

class OffersCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MediaQueryData mediaQuery = MediaQuery.of(context);
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: false,
        aspectRatio: 16 / 9,
        scrollDirection: Axis.horizontal,
      ),
      items: offersList
          .map((item) => Container(
                child: Card(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000)),
              ))
          .toList(),
    );
  }
}
