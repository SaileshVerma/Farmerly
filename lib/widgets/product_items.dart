import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:farmerly/models/product.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItems extends StatelessWidget {
  final String productname;
  final String name;
  final double price;
  final String id;
  final String availability;
  final String location;
  final int phoneno;
  ProductItems(this.id, this.name, this.productname, this.availability,
      this.location, this.price, this.phoneno);
  @override
  Widget build(BuildContext context) {
    //final product = Provider.of<Product>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(productname,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Rs.$price/kg',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(FontAwesomeIcons.calendar),
                  SizedBox(
                    width: 10,
                  ),
                  Text(availability),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: null,
                    icon: Icon(Icons.location_on),
                    label: Text(location),
                  ),

                  //  Text(location),
                  FlatButton(
                      child: Text(
                        "View Details",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/productdetailscreen', arguments: id);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
