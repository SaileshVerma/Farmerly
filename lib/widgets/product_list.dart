import 'package:farmerly/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:farmerly/models/productss.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData =
        Provider.of<Productss>(context); //give access to productsss class
    final product = productData.items; //givve acess to items
    return ListView.builder(
        padding: EdgeInsets.all(6),
        itemCount: product.length,
        itemBuilder: (ctx, item) => Column(
              children: <Widget>[
                ProductItems(
                    product[item].id,
                    product[item].name,
                    product[item].productname,
                    product[item].availability,
                    product[item].location,
                    product[item].price,
                    product[item].phoneno),
                Divider(
                  color: Colors.black,
                  height: 4.0,
                  thickness: 0.4,
                )
              ],
            ));
  }
}
