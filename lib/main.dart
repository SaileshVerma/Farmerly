import 'package:farmerly/widgets/OverViewScreen.dart';

import 'package:farmerly/models/productss.dart';
import 'package:farmerly/screens/AddRequestScreen.dart';
import 'package:farmerly/screens/ProductsDetailsScreen.dart';
import 'package:farmerly/screens/UserProductsScreen.dart';
import 'package:farmerly/screens/auth_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authh(),
        ),
        ChangeNotifierProxyProvider<Authh, Productss>(
            create: (_) => Productss('', [], ''),
            update: (ctx, auth, prevProd) {
              return Productss(auth.token,
                  prevProd == null ? [] : prevProd.items, auth.userId);
            }),
        // ChangeNotifierProvider.value(
        //   value: Productss(),
        // ),
      ],
      child: Consumer<Authh>(
        builder: (ctx, authh, _) => MaterialApp(
          title: 'FarmerLy',
          debugShowCheckedModeBanner: true,
          theme:
              ThemeData(primarySwatch: Colors.grey, accentColor: Colors.grey),
          home: authh.isAuth ? OverViewScreen() : AuthScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
            OverViewScreen.routname: (ctx) => OverViewScreen(),
            AddRequestScreen.routname: (ctx) => AddRequestScreen(),
            UserProductScreen.routname: (ctx) => UserProductScreen(),
          },
        ),
      ),
    );
  }
}
