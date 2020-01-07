import 'package:flutter/material.dart';

class HomeViewWidget extends StatelessWidget {
  final Color color;

  HomeViewWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,  // Remove back Arrow
          actions: <Widget>[
          ],
        ),
    );
  }
}