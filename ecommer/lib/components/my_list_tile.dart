import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  const MyListTile({super.key, this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        // Cambiado de MyListTile a ListTile
        title: Text(title ?? ''),
        leading: Icon(icon),
        onTap: onTap,
      ),
    );
  }
}
