
import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: ProfileScreen()));
}
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Menu Ex'),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String choice) {
              if (choice == 'Profile') {
                // Handle profile option
                // Navigate to the profile screen or show a dialog, etc.
                // Replace this with your implementation.
              } else if (choice == 'Logout') {
                // Handle logout option
                // Perform logout logic, clear user session, etc.
                // Replace this with your implementation.
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(' Your content .'),
      ),
    );
  }
}