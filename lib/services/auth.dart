import 'package:firebase_auth/firebase_auth.dart';
import 'package:learner_edge/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create myUser object based on firebase user
  myUser _userFromFirebaseUser(User user)
  {
    return user !=null ? myUser(uid: user.uid):null;
  }


  // auth change user stream
  Stream<myUser> get user{
    return _auth.authStateChanges()
        .map((User user)=>_userFromFirebaseUser(user));
  }

  // sign in anon

  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  // sign in username pass

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  // register

  Future registerWithEmailAndPassword(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }


  // sign in with google

  Future<UserCredential> signInWithGoogle() async {
    try{
      final GoogleSignInAccount googleUser = await  GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){
      print(e.toString());
      return null;
    }

  }



  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e)
    {
      print(e.toString());
      return null;
    }
  }
}