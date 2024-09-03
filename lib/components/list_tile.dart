// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  Icon icon;
  Text title;
  void Function()? onTap;
  MyListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        leading: icon,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
