import 'package:SetCreator/views/account_view.dart';
import 'package:SetCreator/views/home_view.dart';
import 'package:SetCreator/views/search_view.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
const Color accentColor = Colors.blue;

class _FloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    return showFab ? FloatingActionButton(
          backgroundColor: accentColor,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    height: 350,
                    color: Colors.transparent,
                    child: new Container(
                      child: Icon(Icons.add),
                    ),
                  );
            });
          },
          child: Icon(Icons.add),
        ) : Container();
  }

  void showFloatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}

class _MainWidgetState extends State<MainWidget> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeViewWidget(Colors.white),
    SearchViewWidget(),
    AccountViewWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
        selectedItemColor: accentColor,
      ),
      floatingActionButton: MyFloatingActionButton(),
    );
  }

  void showFilter() {

  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloatingActionButtonState();
}
class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainWidgetState();
}



