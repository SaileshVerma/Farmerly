import 'package:farmerly/models/productss.dart';
import 'package:farmerly/widgets/app_drawer.dart';
import 'package:farmerly/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverViewScreen extends StatefulWidget {
  static const routname = '/overviewscreen';

  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  bool _isloading = false;

  var _isinit = true;

  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        _isloading = true;
      });

      Provider.of<Productss>(context).fetchAndSetData(false).then((_) {
        setState(() {
          _isloading = false;
        });
      });
    }
    _isinit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              'Farmer',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'ly',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductList(),
      drawer: AppDrawer(),
    );
  }
}
