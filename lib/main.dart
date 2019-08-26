import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This will cause any child widget that subscribe to the listener will
    // get notified whenever there's any changes to the data in the provider.
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.purple,
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato'),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          }),
    );
  }
}
