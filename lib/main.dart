
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'views/login_view.dart';
import 'views/main_view.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if User is logged in
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        if(snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          return MainWidget();
        }
        return MaterialApp(
          // Disable DebugModeBanner
          debugShowCheckedModeBanner: false,
          title: 'Login',
          home: LoginPage(),
        );
      },
    );
  }
}
