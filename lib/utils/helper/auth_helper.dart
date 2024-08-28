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

  Future<String> signInWithGoogleEmailAndPassword() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var userCred =await auth.signInWithCredential(credential);
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
