import 'package:farmerly/models/productss.dart';
import 'package:farmerly/widgets/app_drawer.dart';
import 'package:farmerly/widgets/product_items.dart';
import 'package:farmerly/widgets/product_list.dart';
import 'package:farmerly/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverViewScreen extends StatefulWidget {
  static const routname = '/overviewscreen';

  @override
  _OverViewScreenState createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
//  Future<void> _refreshProducts(BuildContext context) async {
//     await Provider.of<Productss>(context, listen: false)
//         .fetchAndSetProducts(true);
//   }

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
              "Farmer",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "ly",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchData());
              })
        ],
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

class SearchData extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final productdts = Provider.of<Productss>(context, listen: false)
        .items
        .where((q) => q.location.contains(query))
        .toList();

    return ListView.builder(
        padding: EdgeInsets.all(6),
        itemCount: productdts.length,
        itemBuilder: (ctx, item) => Column(
              children: <Widget>[
                ProductItems(
                    productdts[item].id,
                    productdts[item].name,
                    productdts[item].productname,
                    productdts[item].availability,
                    productdts[item].location,
                    productdts[item].price,
                    productdts[item].phoneno),
                Divider(
                  color: Colors.black,
                  height: 4.0,
                  thickness: 0.4,
                )
              ],
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //_items.firstWhere((prod) => prod.id == id);
    final productdta = Provider.of<Productss>(context, listen: false).items;
    final slist = query.isEmpty
        ? productdta
        : productdta.where((l) => l.location.contains(query)).toList();

    return slist.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("could not find the location..."),
          )
        : ListView.builder(
            itemCount: slist.length,
            itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    showResults(context);
                  },
                  child: SearchItem(
                    slist[i].location,
                  ),
                ));
  }
}
