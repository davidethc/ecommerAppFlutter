import 'package:ecommer/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 80,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'My Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Menu items
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  MyListTile(
                    title: 'Shop',
                    icon: Icons.store_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/shop_page');
                    },
                  ),
                  MyListTile(
                    title: 'Cart',
                    icon: Icons.shopping_cart_outlined,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/cart_page');
                    },
                  ),
                ],
              ),
            ),
          ),

          // Footer with exit button
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: MyListTile(
              title: 'Exit Shop',
              icon: Icons.logout_outlined,
              onTap:
                  () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/intro_page',
                    (route) => false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
