import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmerly/models/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      child: Column(children: <Widget>[
        Container(
            color: Colors.green,
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Welcome To Farm Market',
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ),
            )),
        ListTile(
          title: FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/overviewscreen');
              },
              icon: Icon(Icons.shopping_basket),
              label: Text('Products')),
        ),
        Divider(),
        ListTile(
          // leading: Text("MyProducts"),
          title: FlatButton.icon(
              label: Text('MyProducts'),
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed('/userproductscreen');
              }),
        ),
        Divider(),
        ListTile(
          title: FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pushNamed('/addrequestscreen');
              },
              icon: Icon(Icons.add_box),
              label: Text('AddRequest')),
        ),
        Divider(),
        ListTile(
          title: FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                Provider.of<Authh>(context).logout();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('LogOut')),
        ),
        Divider(),
      ]),
    );
  }
}
