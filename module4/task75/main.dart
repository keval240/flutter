import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    String message;

    switch (state) {
      case AppLifecycleState.resumed:
        message = "App Resumed";
        break;
      case AppLifecycleState.inactive:
        message = "App Inactive";
        break;
      case AppLifecycleState.paused:
        message = "App Paused";
        break;
      case AppLifecycleState.detached:
        message = "App Detached";
        break;
    }

    Fluttertoast.showToast(msg: message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Activity Lifecycle Demo'),
        ),
        body: Center(
          child: Text('App Lifecycle Stages'),
        ),
      ),
    );
  }
}