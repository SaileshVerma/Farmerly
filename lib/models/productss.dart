import 'package:farmerly/models/product.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Productss with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return _items; //getter for the items of products
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  final String authToken;
  final String userId;
  Productss(this.authToken, this._items, this.userId);

  Future<void> fetchAndSetData([bool filterbyuser = false]) async {
    final filter = filterbyuser ? 'orderBy="creatorId"&equalTo="$userId"' : ' ';
    final url =
        'https://farmerly-390a0.firebaseio.com/products.json?auth=$authToken&$filter';

    final response = await http.get(url);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    if (extractedData == null) {
      return;
    }
    List<Product> loadedproduct = [];
    extractedData.forEach((prodId, prodData) {
      loadedproduct.add(Product(
        id: prodId,
        productname: prodData['productname'],
        availability: prodData['availability'],
        description: prodData['description'],
        location: prodData['location'],
        price: prodData['price'],
        phoneno: prodData['phoneno'],
      ));
    });

    _items = loadedproduct;
    notifyListeners();
  }

  Future<void> addProds(Product prods) async {
    final url =
        'https://farmerly-390a0.firebaseio.com/products.json?auth=$authToken';

    try {
      final response = await http.post(url,
          body: json.encode({
            'creatorId': userId,
            'productname': prods.productname,
            'availability': prods.availability,
            'description': prods.description,
            'location': prods.location,
            'price': prods.price,
            'phoneno': prods.phoneno,
          }));

      final newProd = Product(
          id: json.decode(response.body)['name'],
          productname: prods.productname,
          availability: prods.availability,
          description: prods.description,
          location: prods.location,
          price: prods.price,
          phoneno: prods.phoneno);

      _items.add(newProd);

      notifyListeners();
    } catch (error) {
      return (error);
    }
  }

  Future<void> deleteProds(String idd) async {
    final url =
        'https://farmerly-390a0.firebaseio.com/products/$idd.json?auth=$authToken';
    _items.removeWhere((prod) => prod.id == idd);

    await http.delete(url);
  }
}
