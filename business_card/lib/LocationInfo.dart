import 'package:flutter/material.dart';

class LocationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text('Campinas / SP'), Text('+55 14 911111111')],
    );
  }
}