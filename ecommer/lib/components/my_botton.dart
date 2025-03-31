import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final String? text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.child,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            color:
                Theme.of(
                  context,
                ).colorScheme.onError, // Changed from onPrimary to primary
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(20),

          child: child,
        ),
      ),
    );
  }
}
