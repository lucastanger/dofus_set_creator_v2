import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final Color accentColor = Colors.lightGreen;


/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: Text(
              'item $index',
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }),
      ),
      floatingActionButton: MyFloatingActionButton(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}

class _FloatingActionButtonState extends State<MyFloatingActionButton> {
  bool showFab = true;

  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
          backgroundColor: accentColor,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return new Container(
                    height: 350,
                    color: Colors.transparent,
                    child: new Container(
                      child: Icon(Icons.add),
                    ),
                  );
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

class _BottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Add',
      style: optionStyle,
    ),
    Text(
      'Index 3: Liked',
      style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          title: Text('Add'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          title: Text('Liked'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Account'),
        )
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: accentColor,
      onTap: _onItemTapped,
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class MyFloatingActionButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FloatingActionButtonState();
}