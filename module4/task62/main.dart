import 'package:flutter/material.dart';

void main()
{
   runApp(MaterialApp(
       theme: ThemeData(primarySwatch: Colors.green),
       debugShowCheckedModeBanner: false,
       home: HomeScreen()));
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Ex'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context);
          },
          child: Text(' Alert'),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.warning,
                size: 50,
                color: Colors.red,
              ),
              SizedBox(height: 10),
              Text('This is the alert description.'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('exit'),
            ),
          ],
        );
      },
    );
  }
}