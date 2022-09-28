import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoomclone3/utils/dialogs/app_dialog.dart';

class AuthMethod {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User get user=> _auth.currentUser!;

  Stream<User?> get authChange => _auth.authStateChanges();


logout(BuildContext context)async {
  await _auth.signOut();
  Navigator.pushNamedAndRemoveUntil(context, "/login", (Route<dynamic> route) => false);

}

void signOut()async{
  try{
    _auth.signOut();
  }catch(e){
    print(e);
  }
}
Future<bool>  signInWithGoogle(BuildContext context) async{
    bool res =false;
    try{

      final GoogleSignInAccount?  googleUser =  await GoogleSignIn().signIn();
      final GoogleSignInAuthentication?  googleauth =  await googleUser?.authentication;
      final credential =  GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken,
        idToken: googleauth?.idToken,
      );

      UserCredential userCredential =  await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if(user != null){
         if(userCredential.additionalUserInfo!.isNewUser){ 
            await _firestore.collection('users').doc(user.uid).set({
              'username': user.displayName,
              'uid': user.uid,
              'profilephoto': user.photoURL
            });
         }
         res = true;
      }

    }on FirebaseAuthException catch(e){
      showSnackBar(context, e.message.toString());
        res = false;
    }

    return res;
  }




}