import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatefulWidget
{
  @override
  PorfileState createState() => PorfileState();

}

class PorfileState  extends State<ProfileTab> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                "https://keval333.000webhostapp.com/images/jethalal3.jpeg"),
          ),
          SizedBox(height: 20),
          Text(
            'Jetha Done',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Jethadone@example.com',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Add an action for editing the profile
            },
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }

}