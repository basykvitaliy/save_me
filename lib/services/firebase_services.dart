import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:save_me/helpers/constants.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus _status = AuthStatus.unknown;
  static RxString notificationId = "".obs;

  CollectionReference collectionLogos = FirebaseFirestore.instance.collection("logos");
  CollectionReference collectionUsers = FirebaseFirestore.instance.collection("users");

  String getUserId() => _auth.currentUser!.uid;

  Future<String> uploadImageToFirebaseStorage(String imagePath) async {
    var result;
    final storage = FirebaseStorage.instance;
    final File imageFile = File(imagePath);
    final String fileName = "${DateTime.now().millisecondsSinceEpoch}.jpg";
    final Reference reference = storage.ref().child(getUserId()).child(fileName);
    try {
      final UploadTask uploadTask = reference.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        final String photoUrl = await reference.getDownloadURL();
        result = photoUrl;
      });
    } catch (e) {
      print("Error uploading file: $e");
    }
    return result;
  }

  Future<AuthStatus> removeCard(String docId) async {
    var uid = getUserId();
    await collectionUsers.doc(uid).collection("cards").doc(docId).delete().whenComplete(() {
      _status = AuthStatus.successful;
    }).catchError((e) => _status = AuthExceptionHandler.handleAuthException(e));
    return _status;
  }

  /// Sign in with google.
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    //final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    //
    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    return googleUser;
  }

  /// Sign in account.
  Future<String?>? signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e, stack) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }

    return time;
  }

  /// Update field last_activity from collection manager.
  Future<void> updateManager(String time) async {
    await collectionLogos
        .doc(getUserId())
        .update({'last_activity': time})
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
  }

}

class AuthExceptionHandler {
  static handleAuthException(FirebaseAuthException e) {
    AuthStatus status;
    switch (e.code) {
      case "invalid-email":
        status = AuthStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthStatus.wrongPassword;
        break;
      case "weak-password":
        status = AuthStatus.weakPassword;
        break;
      case "email-already-in-use":
        status = AuthStatus.emailAlreadyExists;
        break;
      default:
        status = AuthStatus.unknown;
    }
    return status;
  }

  static String generateErrorMessage(error) {
    String errorMessage;
    switch (error) {
      case AuthStatus.invalidEmail:
        errorMessage = "Your email address appears to be malformed.";
        break;
      case AuthStatus.weakPassword:
        errorMessage = "Your password should be at least 6 characters.";
        break;
      case AuthStatus.wrongPassword:
        errorMessage = "Your email or password is wrong.";
        break;
      case AuthStatus.emailAlreadyExists:
        errorMessage = "The email address is already in use by another account.";
        break;
      default:
        errorMessage = "An error occured. Please try again later.";
    }
    return errorMessage;
  }
}
