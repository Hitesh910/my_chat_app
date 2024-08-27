import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  static AuthHelper helper = AuthHelper._();

  User? user;

  AuthHelper._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Success";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<void> singOut() async {
    await auth.signOut();
  }

  bool checkUser() {
    user = auth.currentUser;
    return user!=null;
  }

  Future<String> signInWithGoogleEmailAndPassword()
  async {
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    var cred = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken,idToken: googleSignInAuthentication.idToken);
    UserCredential userCred = await auth.signInWithCredential(cred);
    user = userCred.user;
    if(user != null)
      {
        return "Success";
      }
    else
      {
        return "Failed";
      }
  }
}
