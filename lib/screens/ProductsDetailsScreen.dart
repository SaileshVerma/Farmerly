import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmerly/models/productss.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/productdetailscreen';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void callnow(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("couldn place a call");
    }
  }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Productss>(context).findById(productId);
    // _items.firstWhere((prod) => prod.id == id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(loadedProduct.productname),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Product : " + loadedProduct.productname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Price : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    loadedProduct.price.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Location : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(loadedProduct.location, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Availability till: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(loadedProduct.availability,
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Contact No. : ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(loadedProduct.phoneno.toString(),
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Text(
                "Details : ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                loadedProduct.description,
                style: TextStyle(fontSize: 18),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),

//

//
      floatingActionButton: FloatingActionButton(
        elevation: 9.0,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.call,
          color: Colors.white,
        ),
        onPressed: () {
          callnow("tel: +" + loadedProduct.phoneno.toString());
        },
      ),
    );
  }
}
