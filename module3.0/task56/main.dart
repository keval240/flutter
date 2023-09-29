
import 'package:flutter/material.dart';



class image extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("ImageWithText"),),
      body: ImageWithText(),
      floatingActionButton: FloatingActionButton
        (
        child: Icon(Icons.navigate_next),
        onPressed: ()
        {
          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => ColorSelectorScreen()));
        },
      ),
    );
  }

}

class ImageWithText extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://roasting-conflict.000webhostapp.com/images/smart.webp",
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://roasting-conflict.000webhostapp.com/images/smart.webp',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Text is Here',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://roasting-conflict.000webhostapp.com/images/smart.webp',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://roasting-conflict.000webhostapp.com/images/smart.webp',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
          ],
        ),

      ],

    );

  }
}
