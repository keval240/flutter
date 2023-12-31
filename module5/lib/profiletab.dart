import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 5, // Add elevation here
            shape: CircleBorder(),
            child: CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage("https://keval333.000webhostapp.com/images/man_icon.jpeg"),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'RK',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                'Kevalr******@example.com',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              // Add an action for editing the profile
            },
            icon: Icon(Icons.edit),
            label: Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey, // Button color
              onPrimary: Colors.black87, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // SizedBox(height: 20),
          // Text(
          //   'Bio: keval Developer',
          //   style: TextStyle(
          //     fontSize: 18,
          //   ),
          // ),
          // Text(
          //   'Location: Rajkot,Gujrat ,India',
          //   style: TextStyle(
          //     fontSize: 18,
          //   ),
          // ),
        ],
      ),
    );
  }
}