import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String productname;
  final String description;
  final double price;
  final String location;
  final String availability;
  final int phoneno;

  Product(
      {@required this.id,
      @required this.name,
      @required this.productname,
      @required this.availability,
      @required this.description,
      @required this.location,
      @required this.price,
      @required this.phoneno});
}
