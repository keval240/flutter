import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    /*return MaterialApp(
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );*/


    final Future<FirebaseApp> _initailization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initailization,
        builder: (context, snapshot) {
          //Something from Firebase
          if (snapshot.hasError) {
            print('Something Went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                ),
              ),
              home: LoginPage(),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });

  }



}