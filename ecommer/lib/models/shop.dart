import 'package:ecommer/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product 1
    Product(
      imagePath: '/Users/monky02/Desktop/ecommer/lib/images/nike_air.png',
      name: 'Nike Air Max',
      price: '200',
      description: 'Premium running shoes with advanced cushioning technology',
    ),
    //product 2
    Product(
      imagePath:
          '/Users/monky02/Desktop/ecommer/lib/images/adidas_sport_tee.png',
      name: 'Adidas Sport Tee',
      price: '100',
      description:
          'Breathable women\'s athletic t-shirt with moisture-wicking fabric',
    ),
    //product 3
    Product(
      imagePath: '/Users/monky02/Desktop/ecommer/lib/images/clasic.jpg',
      name: 'Classic Denim',
      price: '30',
      description: 'Premium quality men\'s jeans with comfortable fit',
    ),
    //product 4
    Product(
      imagePath: '/Users/monky02/Desktop/ecommer/lib/images/cozy.png',
      name: 'Cozy Sweater',
      price: '500',
      description: 'Warm winter sweater made with premium wool blend',
    ),
  ];
  //user cart
  List<Product> _userCart = [];
  //getter
  List<Product> get shop => _shop;
  List<Product> get userCart => _userCart;
  //add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    // Remove this line:
    // _shop.remove(product);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    _shop.add(product);
    notifyListeners();
  }
}
