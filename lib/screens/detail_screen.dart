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
      body: Column(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                  flex: 1,
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text('Select'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'OK',
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Close',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Size')),
                        Expanded(flex: 1, child: Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Select'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'OK',
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Close',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Color')),
                        Expanded(flex: 1, child: Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Select'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  'OK',
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Close',
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Text('Qty')),
                        Expanded(flex: 1, child: Icon(Icons.arrow_drop_down))
                      ],
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.22,
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                      height: 50,
                      onPressed: () {},
                      color: Colors.white,
                      splashColor: Colors.deepOrange.shade300,
                      textColor: Colors.deepOrange,
                      child: Expanded(child: Text('Add to Cart')))),
              Expanded(
                  child: MaterialButton(
                      height: 50,
                      onPressed: () {},
                      color: Colors.deepOrange,
                      textColor: Colors.white,
                      child: Expanded(child: Text('Buy Now')))),
            ],
          ),
        ],
      ),
    );
  }
}
