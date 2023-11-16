import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task61/profile.dart';

import 'cart.dart';


void main()
{
  runApp(MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: menuscreen()));
}

class menuscreen extends StatefulWidget {
  @override
  menuState createState() => menuState();
}

class menuState extends State<menuscreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    CartTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomeTab> {
  final List<MenuItem> menuItems = [
    MenuItem("https://keval333.000webhostapp.com/images/bhel.jpeg", "Bhel", 8),
    MenuItem("https://keval333.000webhostapp.com/images/coldcoffee.jpeg", "Cold coffe",6.6),
    MenuItem("https://keval333.000webhostapp.com/images/dabeli.jpeg", "Dabeli", 3.5),
    MenuItem("https://keval333.000webhostapp.com/images/icecream.jpeg", "ice-cream", 5.99),
    MenuItem("https://keval333.000webhostapp.com/images/missalpav.jpeg", "Misal-pav", 5.99),
    MenuItem("https://keval333.000webhostapp.com/images/pizza.jpeg", "Pizza", 9.99),
    MenuItem("https://keval333.000webhostapp.com/images/punjabi.jpeg", "Punjabi", 10.99),
    MenuItem("https://keval333.000webhostapp.com/images/pavbhaji.jpg", "Pav-Bhaji", 9.99),

  ];

  @override
  Widget build(BuildContext context) {
    final List<String> tags = ["Recommend", "Popular", "Pav-Bhaji", "Pizza", "Dabeli", "Ice-cream"];
    bool _color = true; // Initialize _color with a default value

    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
          color: Colors.white,
          height: 55, // Set the desired height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tags.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(12.5),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: _color ? Colors.orangeAccent : Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(tags[index], style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added ${menuItems[index].name} to cart'),
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(menuItems[index].image, height: 100),
                      Text(
                        menuItems[index].name,
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(
                            '\$${menuItems[index].price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 30),
                          Container(
                            color: Colors.orange,
                            alignment: Alignment.center,
                            height: 25,
                            width: 25,
                            child: Center(
                              child: IconButton(
                                padding: EdgeInsets.all(0.5),
                                onPressed: () async {
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  List<String> cartItems = prefs.getStringList('cartItems') ?? [];
                                  cartItems.add(menuItems[index].name + " " + menuItems[index].price.toString());
                                  await prefs.setStringList('cartItems', cartItems);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Added ${menuItems[index].name} to cart'),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  final String image;
  final String name;
  final double price;

  MenuItem(this.image, this.name, this.price);
}





