import 'package:flutter/material.dart';
import 'package:my_shop/providers/orders.dart';
import 'package:my_shop/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cartData.totalAmount}',
                    style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child: Text('ORDER NOW'),
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false).addOrder(
                        cartData.items.values.toList(), cartData.totalAmount);
                    cartData.clearCart();
                    Navigator.of(context).pushNamed(OrdersScreen.routeName);
                  },
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (ctx, idx) => CartItem(
                id: cartData.items.values.toList()[idx].id,
                productId: cartData.items.keys
                    .toList()[idx], // productId is used as a key in CartItem
                title: cartData.items.values.toList()[idx].title,
                price: cartData.items.values.toList()[idx].price,
                quantity: cartData.items.values.toList()[idx].quantity,
              ),
            ),
          )
        ],
      ),
    );
  }
}
