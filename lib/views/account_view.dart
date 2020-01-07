import 'package:flutter/material.dart';

class AccountViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            title: Container(
              color: Colors.red,
              height: 100,
              width: 280,
              child: Container(
              ),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,  // Remove back Arrow
          ),
          preferredSize: Size.fromHeight(160.0))
    );
  }
}