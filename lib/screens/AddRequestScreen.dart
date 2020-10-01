import 'package:farmerly/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmerly/models/productss.dart';

class AddRequestScreen extends StatefulWidget {
  static const routname = '/addrequestscreen';
  @override
  _AddRequestScreenState createState() => _AddRequestScreenState();
}

class _AddRequestScreenState extends State<AddRequestScreen> {
  final _focus = FocusNode();

  final _desc = FocusNode();

  final _pri = FocusNode();

  final _loc = FocusNode();

  final _avail = FocusNode();
  final _cont = FocusNode();
  final _gkey = GlobalKey<FormState>();
  var _editedprod = Product(
      id: null,
      productname: '',
      availability: '',
      description: '',
      location: '',
      price: 0,
      phoneno: 0);

  @override
  void dispose() {
    _cont.dispose();
    _focus.dispose();
    _desc.dispose();
    _pri.dispose();
    _loc.dispose();
    _avail.dispose();
    super.dispose();
  }

  Future<void> _saveform() async {
    _gkey.currentState.save();

    try {
      await Provider.of<Productss>(context).addProds(_editedprod);
    } catch (error) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('!! Error'),
          content: Text('An error ocuured due to somme issue '),
          actions: <Widget>[
            FlatButton(
              child: Text('okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Add a New Post'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _saveform(),
            icon: Icon(Icons.send),
            //label: Text('Post'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _gkey,
          child: ListView(children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ProductName',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_focus);
              },
              onSaved: (value) {
                _editedprod = Product(
                    id: _editedprod.id,
                    productname: value,
                    availability: _editedprod.availability,
                    description: _editedprod.description,
                    location: _editedprod.location,
                    price: _editedprod.price,
                    phoneno: _editedprod.phoneno);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              focusNode: _focus,
              textInputAction: TextInputAction.next,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_desc);
              },
              onSaved: (value) {
                _editedprod = Product(
                    id: _editedprod.id,
                    productname: _editedprod.productname,
                    availability: _editedprod.availability,
                    description: value,
                    location: _editedprod.location,
                    price: _editedprod.price,
                    phoneno: _editedprod.phoneno);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              focusNode: _desc,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_pri);
              },
              onSaved: (value) {
                _editedprod = Product(
                    id: _editedprod.id,
                    productname: _editedprod.productname,
                    availability: _editedprod.availability,
                    description: _editedprod.description,
                    location: _editedprod.location,
                    price: double.parse(value),
                    phoneno: _editedprod.phoneno);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              focusNode: _pri,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_loc);
              },
              onSaved: (value) {
                _editedprod = Product(
                    id: _editedprod.id,
                    productname: _editedprod.productname,
                    availability: _editedprod.availability,
                    description: _editedprod.description,
                    location: value,
                    price: _editedprod.price,
                    phoneno: _editedprod.phoneno);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Availability Till(Last Date)',
              ),
              focusNode: _loc,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_cont);
              },
              onSaved: (value) {
                _editedprod = Product(
                    id: _editedprod.id,
                    productname: _editedprod.productname,
                    availability: value,
                    description: _editedprod.description,
                    location: _editedprod.location,
                    price: _editedprod.price,
                    phoneno: _editedprod.phoneno);
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact No.',
              ),
              focusNode: _cont,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSaved: (value) {
                _editedprod = Product(
                  id: _editedprod.id,
                  productname: _editedprod.productname,
                  availability: _editedprod.availability,
                  description: _editedprod.description,
                  location: _editedprod.location,
                  price: _editedprod.price,
                  phoneno: int.parse(value),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
