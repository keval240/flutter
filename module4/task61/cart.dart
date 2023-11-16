import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartTab extends StatefulWidget {
  @override
  CartState createState() => CartState();
}

class CartState extends State<CartTab> {
  List<String> cartItems = [];
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      cartItems = prefs.getStringList('cartItems') ?? [];
      calculateTotal();
    });
  }

  void calculateTotal() {
    totalAmount = 0.0;
    for (String cartItemName in cartItems) {
      final List<String> parts = cartItemName.split(' ');
      final String itemName = parts.getRange(0, parts.length - 1).join(' ');
      final double itemPrice = itemPrices[itemName] ?? 0.0;
      totalAmount += itemPrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    var today = DateTime.now();
    var dateFormat = DateFormat('dd-MM-yyyy');
    String currentDate = dateFormat.format(today);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              currentDate,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(" \$${totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      clearCart();
                    },
                    child: Text("Checkout"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cartItems');
    setState(() {
      cartItems = [];
      totalAmount = 0.0;
    });
  }

  final Map<String, double> itemPrices = {
    'burger': 10.99,
    'coffe': 12.99,
    'cold coffee': 9.99,
    'dosa': 7.99,
    'Fafda Jlebi': 5.99,
    'gujarati-thali': 10.99,
    'pizza': 12.99,
    'poha': 9.99,
    'Samosa': 7.99,
    'vadapav': 5.99,
  };
}