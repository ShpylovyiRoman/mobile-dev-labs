import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Mini shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: deprecated_member_use
  List<Item> _items = List<Item>();

  // ignore: deprecated_member_use
  List<Item> _cartList = List<Item>();

  @override
  void initState() {
    super.initState();
    _populateItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.redAccent[400],
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(Icons.shopping_basket_rounded , size: 40, color: Colors.white),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: CircleAvatar(
                        radius: 10.0,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(25.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          var item = _items[index];
          return Card(
              elevation: 25.0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_cartList.contains(item))
                            ? Colors.grey
                            : item.color,
                        size: 90.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 80.0,
                      bottom: 80.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateItems() {
    var list = <Item>[
      Item(
        name: 'Clock',
        icon: Icons.access_time,
        color: Colors.redAccent[400],
      ),
      Item(
        name: 'Son',
        icon: Icons.accessibility_new_rounded,
        color: Colors.redAccent[400],
      ),
      Item(
        name: 'Camera',
        icon: Icons.add_a_photo,
        color: Colors.redAccent[400],
      ),
      Item(
        name: 'Home',
        icon: Icons.add_business_rounded,
        color: Colors.redAccent[400],
      ),
      Item(
        name: 'Tractor',
        icon: Icons.agriculture_sharp,
        color: Colors.redAccent[400],
      ),
      Item(
        name: 'Legs',
        icon: Icons.airline_seat_legroom_reduced,
        color: Colors.redAccent[400],
      ),
    ];

    setState(() {
      _items = list;
    });
  }
}

class Cart extends StatefulWidget {
  final List<Item> _cart;
  Cart(this._cart);
  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  List<Item> _cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Items'),
        backgroundColor: Colors.redAccent[400],
      ),
      body: ListView.builder(
          itemCount: _cart.length,
          itemBuilder: (context, index) {
            var item = _cart[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Card(
                elevation: 10.0,
                child: ListTile(
                  leading: Icon(
                    item.icon,
                    color: item.color,
                  ),
                  title: Text(item.name),
                  trailing: GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          _cart.remove(item);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}

class Item {
  final String name;
  final IconData icon;
  final Color color;

  Item({this.name, this.icon, this.color});
}