
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mychat/Parts/User.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Condition ? True : False
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(userId: user.uid) : null;
  }

  Future signupWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future loginWithEmailAndPAssword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }
    catch(e){
      print(e.toString());
    }
  }

  Future resetPassword(String email) async{
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }
    catch(e){
      print(e.toString());
    }
  }

  Future signout() async{
    try{
      return await _auth.signOut();
    }
    catch(e){

    }
  }
}