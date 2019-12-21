import 'package:flutter/material.dart';

class SearchViewWidget extends StatelessWidget {

  final List<String> entries = <String>['A', 'B', 'C', 'D','A', 'B', 'C', 'D','A', 'B', 'C', 'D'];
  final List<int> colorCodes = <int>[600, 500, 100, 50, 600, 500, 100, 50, 600, 500, 100, 50];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200,
            color: Colors.lightBlue[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}