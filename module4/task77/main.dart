
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main()
{
  runApp(MaterialApp(theme:ThemeData(primarySwatch: Colors.green),home: MyApp()));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

        appBar: AppBar
          (title: Text("CALL & SMS "),),
        body: Center
          (
          // 1. Write Some Code Text
          //child:
          //child: Text("Welcome to tops"),
          child: Column(

            children:
            [
              SizedBox(width: 50,height: 50),
              Image.network("https://keval333.000webhostapp.com/images/call.jpeg"),




              SizedBox(width: 50,height: 50),

              ElevatedButton(

                child: Text("Send SMS"),
                onPressed: ()
                {
                  sendSms();
                },
              ),
             SizedBox(width: 50,height: 50),

              Image.network("https://keval333.000webhostapp.com/images/sms.jpeg"),

              SizedBox(width: 50,height: 50),

              ElevatedButton(onPressed: (){

                callnum();

              }, child: Text("call ")),



            ],
          ),
        )
    );








  }
  void sendSms()
  {
    //final String url = 'sms:$phoneNumber';
    //var  url = Uri("sms:9510411989")
    //launchUrl(url);

    var url = Uri.parse("sms:9510411989");
    launchUrl(url);

  }


  void callnum()
  {

    var url = Uri.parse("tel:9510411989");
    launchUrl(url);
  }

}