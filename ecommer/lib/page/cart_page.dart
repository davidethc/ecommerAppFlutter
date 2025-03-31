import 'package:ecommer/components/my_botton.dart';
import 'package:ecommer/components/my_drawer.dart';
import 'package:ecommer/models/product.dart';
import 'package:ecommer/models/shop.dart';
import 'package:ecommer/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().userCart;

    // Add this method to calculate total
    double calculateTotal(List<Product> cart) {
      return cart.fold(0, (total, item) => total + double.parse(item.price));
    }

    // Add this method to clear cart
    void clearCart(BuildContext context) {
      final shop = context.read<Shop>();
      for (final item in List.from(shop.userCart)) {
        shop.removeItemFromCart(item);
      }
    }

    void removeItemFromCart(Product product) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text('Remove from cart?'),
              content: Text(
                'Are you sure you want to remove this item from your cart?',
              ),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeItemFromCart(product);
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
      );
    }

    void payButtonPressed(BuildContext context) {
      // Get the shop instance
      final shop = context.read<Shop>();

      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: Text('Payment successful!'),
              actions: [
                MaterialButton(
                  onPressed: () {
                    // Clear all items from cart
                    for (final item in List.from(shop.userCart)) {
                      shop.removeItemFromCart(item);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Cart Page'),
        foregroundColor: Colors.black,
        actions: [
          if (cart.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete_sweep),
              onPressed: () => clearCart(context),
            ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          Expanded(
            child:
                cart.isEmpty
                    ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Your cart is empty',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                    : ListView.builder(
                      itemCount: cart.length,
                      padding: EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return Card(
                          margin: EdgeInsets.only(bottom: 15),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.imagePath,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(item.name),
                            subtitle: Text('\$${item.price}'),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle_outline),
                              onPressed: () => removeItemFromCart(item),
                            ),
                          ),
                        );
                      },
                    ),
          ),
          if (cart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontSize: 20)),
                      Text(
                        '\$${calculateTotal(cart).toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    onTap: () => payButtonPressed(context),
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
