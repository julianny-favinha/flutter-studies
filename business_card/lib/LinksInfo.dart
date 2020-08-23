import 'package:flutter/material.dart';

class LinksInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.accessibility),
        Icon(Icons.favorite),
        Icon(Icons.add_a_photo),
        Icon(Icons.cake),
      ],
    );
  }
}