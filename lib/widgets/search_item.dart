import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String location;
  SearchItem(this.location);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.location_on),
      title: Text(location),
    );
  }
}
