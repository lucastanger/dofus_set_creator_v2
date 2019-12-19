import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: MyFloatingActionButton(),
      body: GestureDetector(
          onTap: () {

          },
          child: Center(
            child: Text('MainPage'),
          )
      ),
    );
  }
}

class _FloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
      onPressed: () {
        var bottomSheetController = showBottomSheet(
            context: context,
            builder: (context) => Container(
              color: Colors.black87,
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 20.0),

            ));
        showFloatingActionButton(false);

        bottomSheetController.closed.then((value) {
          showFloatingActionButton(true);
        });
      },
      child: Icon(Icons.add),
    )
        : Container();
  }

  void showFloatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloatingActionButtonState();
}