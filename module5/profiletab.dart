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
              backgroundImage: NetworkImage("https://keval333.000webhostapp.com/images/jethalal3.jpeg"),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Jetha Done',
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
                'Jethadone@example.com',
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
              primary: Colors.blue, // Button color
              onPrimary: Colors.white, // Text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Bio: Flutter Developer',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            'Location: New York, USA',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}