import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;

  const ProductItem({this.id, this.imageUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        backgroundColor: Colors.black54,
      ),
    );
  }
}
