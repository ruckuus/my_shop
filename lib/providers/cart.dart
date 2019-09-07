import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
//      print('key: ' + key);
//      print('cartItem: ' + cartItem.id);
//      print('cartItem: ' + cartItem.title);
//      print('cartItem: ' + cartItem.quantity.toString());
//      print('cartItem: ' + cartItem.price.toString());
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingCartItem) {
        int updatedQuantity = existingCartItem.quantity + 1;
//        print('Updating item into cart: ' + productId);
//        print('Updating item into cart: ' + existingCartItem.id);
//        print('Updating item into cart: ' + updatedQuantity.toString());
        return CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: updatedQuantity);
      });
    } else {
      _items.putIfAbsent(productId, () {
//        print('Adding item into cart: ' + productId);
        return CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1);
      });
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (existing) => CartItem(
              id: existing.id,
              title: existing.title,
              price: existing.price,
              quantity: existing.quantity - 1));
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
