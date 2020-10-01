import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmerly/models/productss.dart';

class UserProdItem extends StatelessWidget {
  final String prodname;
  final double price;
  final String prodid;
  UserProdItem(this.prodname, this.price, this.prodid);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        prodname,
        style: TextStyle(fontSize: 18),
      ),
      title: Text(price.toString()),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Provider.of<Productss>(context).deleteProds(prodid);
          }),
    );
  }
}
