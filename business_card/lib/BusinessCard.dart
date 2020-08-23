import 'package:flutter/material.dart';
import 'PersonInfo.dart';
import 'LocationInfo.dart';
import 'LinksInfo.dart';

class BusinessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  PersonInfo(),
                  SizedBox(
                    height: 8,
                  ),
                  LocationInfo(),
                  SizedBox(
                    height: 8,
                  ),
                  LinksInfo()
                ],
              ),
            )
        ),
        Spacer()
      ],
    );
  }
}
