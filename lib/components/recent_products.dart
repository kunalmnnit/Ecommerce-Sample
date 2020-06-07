import 'package:cart/utilities/constanst.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productlist = [
    {
      "name": "Blazer",
      "picture": blazer,
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": dress,
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Female Blazer",
      "picture": blazer2,
      "old_price": 100,
      "price": 50,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productlist.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            prodname: productlist[index]['name'],
            prodpicture: productlist[index]['picture'],
            prodoldprice: productlist[index]['old_price'],
            prodprice: productlist[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final prodname;
  final prodpicture;
  final prodoldprice;
  final prodprice;

  SingleProduct(
      {this.prodname, this.prodpicture, this.prodoldprice, this.prodprice});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Hero(
            tag: prodname,
            child: Material(
              child: InkWell(
                onTap: () {},
                child: GridTile(
                    footer: Container(
                      color: Colors.white70,
                      child: ListTile(
                        leading: Text(
                          prodname,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text('\$$prodprice'),
                      ),
                    ),
                    child: Image.asset(
                      prodpicture,
                      fit: BoxFit.cover,
                    )),
              ),
            )),
      ),
    );
  }
}
