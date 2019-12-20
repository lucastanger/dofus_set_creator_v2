import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  final Color color;

  HomeViewWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}