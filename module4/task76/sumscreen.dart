
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SumScreen extends StatelessWidget {
  final double sum;

  SumScreen({required this.sum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Screen'),
      ),
      body: Center(
        child: Text('Sum: $sum'),
      ),
    );
  }
}