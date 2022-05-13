import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Auth change stream
  Stream<User?> get user{
    return _auth.authStateChanges();
    //map(_userFromFirebaseUser);
  }

  //Signin anonymous
  Future signInAnon() async {

    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    }
    catch(e){
      print("Error is ${e.toString()}");
      return null;
    }
  }

  //Sigin with email and password
  Future registerwithEmail(String email,String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    }catch(e)
    {
      print("Error in sigin ${e.toString()}");
      return null;
    }
  }

  Future signInWithEmail(String email,String password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    }catch(e)
    {
      print("Error in sigin ${e.toString()}");
      return null;
    }
  }


  //Sigout
  Future signOut() async{
    try{
      return await _auth.signOut();
    } catch(e) {
      print("Error is ${e.toString()}");
      return null;
    }
  }
}