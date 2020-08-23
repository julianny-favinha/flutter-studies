import 'package:flutter/material.dart';

class PersonInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.account_circle,
          size: 35,
        ),
        SizedBox(
          width: 8,
        ),
        NameInfo()
      ],
    );
  }
}

class NameInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Julianny Favinha Donda',
        ),
        Text(
          'Developer',
        )
      ],
    );
  }
}