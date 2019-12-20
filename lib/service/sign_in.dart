import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
// Google Login
final GoogleSignIn googleSignIn = GoogleSignIn();
final AppleSignIn appleSignIn = AppleSignIn();
// Facebook Login
//final facebookLogin = FacebookLogin();
//final result = await facebookLogin.logInWithReadPermissions(['email']);

// Google SignIn Method
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}
// Google SignOut Method
void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}

Future<String> signInWithFacebook() async {
  return null;
}

void signOutFacebook() async {

}