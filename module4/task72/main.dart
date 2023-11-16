import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main()
{
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: call()));
}
class call extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<call> {
  @override
  void initState() {
    super.initState();
    _requestPhoneCallPermission();
  }

  Future<void> _requestPhoneCallPermission() async {
    final status = await Permission.phone.request();

    if (status.isGranted) {
      // Permission granted, you can proceed with your app logic here.
    }
    else if (status.isDenied || status.isRestricted || status.isPermanentlyDenied)
    {
      // Permission denied, show a dialog to explain why it's needed.
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Permission Required'),
          content: Text('This app needs phone call permission to make calls.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Deny'),
            ),
            TextButton(
              onPressed: () {
                openAppSettings(); // Open app settings to grant permission.
                Navigator.of(context).pop();
              },
              child: Text('Allow'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call '),
      ),
      body: Center(
        child: Text('Welcome to the Phone Call App'),
      ),
    );
  }
}