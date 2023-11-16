import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: MyList()));
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  List<String> items = ['Item 1', 'Item 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Context Menu'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item),
            onTap: () {
              _showContextMenu(context, item);
            },
          );
        },
      ),
    );
  }

  void _showContextMenu(BuildContext context, String item) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  Navigator.pop(context); // Close the context menu
                  _editItem(item);
                },
              ),
              ListTile(
                leading: Icon(Icons.visibility),
                title: Text('View'),
                onTap: () {
                  Navigator.pop(context); // Close the context menu
                  _viewItem(item);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context); // Close the context menu
                  _deleteItem(item);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _editItem(String item) {
    // Implement your edit logic here
    print('Editing item: $item');
  }

  void _viewItem(String item) {
    // Implement your view logic here
    print('Viewing item: $item');
  }

  void _deleteItem(String item) {
    // Implement your delete logic here
    setState(() {
      items.remove(item);
    });
    print('Deleting item: $item');
  }
}