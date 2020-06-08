import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    List<dynamic> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args[0].toString()),
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
          Container(
            height: mediaQuery.size.height * 0.5,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(
                  args[1],
                  fit: BoxFit.none,
                ),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    args[0],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        '\$' + args[2].toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: Text(
                        '\$' + args[3].toString(),
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Size')),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Color')),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text('Qty')),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Expanded(child: Text('Buy Now')))),
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.deepOrange.shade400,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.deepOrange.shade400,
                  ),
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
