// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Widget? child;
  void Function()? onTap;
  Color? color;
  MyButton({
    super.key,
    required this.child,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}
