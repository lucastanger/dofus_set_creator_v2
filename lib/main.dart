
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'main_page.dart';

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
          // TODO: Fix this
          // return MyStatelessWidget();
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




