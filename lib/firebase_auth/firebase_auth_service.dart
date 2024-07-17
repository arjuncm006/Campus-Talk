
import 'package:clg_chat/firebase/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../components/toast.dart';


class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;


  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<User?> signUpWithEmailAndPassword(String email, String password ,String NAME) async {

    try {
      UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email,
          password: password);




      _firestore.collection("tjit_3_cse_b").doc(credential.user!.uid).set(
          {
            'uid':credential.user!.uid,
            'email':email,
            'user_name': NAME
          }
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {

      if (e.code == 'email-already-in-use') {
        showToast(message: 'The email address is already in use.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }
    }
    return null;




  }

  Future<User?> signInWithEmailAndPassword(String email, String password, ) async {

    try {
      UserCredential credential =await _auth.signInWithEmailAndPassword(email: email,
          password: password);



      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else {
        showToast(message: 'An error occurred: ${e.code}');
      }

    }
    return null;

  }


  Future<void> SignOut() async {
    return await _auth.signOut();
  }

}

