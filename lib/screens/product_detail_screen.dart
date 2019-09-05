import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final foundProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(foundProduct.title),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Card(
          margin: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  foundProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                foundProduct.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('\$${foundProduct.price}'),
              Text(
                foundProduct.description,
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
