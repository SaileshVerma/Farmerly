import 'package:farmerly/widgets/app_drawer.dart';
import 'package:farmerly/widgets/userproducts_items.dart';
import 'package:flutter/material.dart';
import 'package:farmerly/models/productss.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatefulWidget {
  static const routname = '/userproductscreen';

  @override
  _UserProductScreenState createState() => _UserProductScreenState();
}

class _UserProductScreenState extends State<UserProductScreen> {
  var loading = false;
  var _isinit = true;
  @override
  void didChangeDependencies() {
    if (_isinit) {
      setState(() {
        loading = true;
      });

      Provider.of<Productss>(context).fetchAndSetData(true).then((_) {
        setState(() {
          loading = false;
        });
      });
    }
    _isinit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Productss>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Your Requests"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('/addrequestscreen');
              })
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: productData.items.length,
              itemBuilder: (ctx, i) => Column(
                children: <Widget>[
                  UserProdItem(productData.items[i].productname,
                      productData.items[i].price, productData.items[i].id),
                  Divider(
                    color: Colors.black,
                    thickness: 0.2,
                  ),
                ],
              ),
            ),

      drawer:
          AppDrawer(), //here we show the usrr requests in list tilessss ook  ,
    );
  }
}
