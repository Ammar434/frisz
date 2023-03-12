import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frisz/services/secure_storage.dart';
import 'package:frisz/utils/messages.dart';

import '../models/custom_user.dart';
import 'firebase_storage_methods.dart';

Uint8List? temporaryUserImage;
String temporaryCountry = "";
String temporaryState = "";
String? temporaryProfession;
String? temporaryFavoriteSport;
bool temporaryIsProfesionalAthelete = false;
String tmpSportingProfile = "";

class AuthenticationMethod {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorageMethods _firebaseStorageMethods = FirebaseStorageMethods();
  final SecureStorageMethods _secureStorageMethods = SecureStorageMethods();

  bool isEmailValid(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  Future<String> registerUser() async {
    String res = ERROR_MESSAGE;

    try {
      String userName = await _secureStorageMethods.getUserNameFromSecureStorage();
      String password = await _secureStorageMethods.getUserPasswordFromSecureStorage();
      String email = await _secureStorageMethods.getUserEmailromSecureStorage();
      String pseudo = await _secureStorageMethods.getUserPseudoFromSecureStorage();
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String profileImageUrl = temporaryUserImage == null
          ? "https://i.stack.imgur.com/l60Hf.png"
          : await _firebaseStorageMethods.uploadImageToStorage(
              "profilePics",
              temporaryUserImage!,
              false,
            );

      CustomUser customUser = CustomUser(
        username: userName,
        uid: credential.user!.uid,
        photoUrl: profileImageUrl,
        email: email,
        country: temporaryCountry,
        state: temporaryState,
        followers: [],
        following: [],
        isProfesionalAthelete: temporaryIsProfesionalAthelete,
        profession: temporaryProfession ?? "",
        favoriteSport: temporaryFavoriteSport ?? "",
        pseudo: pseudo,
        sportingProfile: tmpSportingProfile,
      );

      await _firebaseFirestore.collection('users').doc(credential.user!.uid).set(customUser.toJson());
      res = SUCCESS_MESSAGE;
    } on FirebaseAuthException catch (error) {
      if (error.code == "invalid-email") {
        res = "The email is badly formatted";
      } else if (error.code == "week-password") {
        res = "Please enter a stronger password";
      } else if (error.code == "email-already-in-use") {
        res = "This email is already used in our database";
      }
    } catch (e) {
      res = e.toString();
    }

    await _secureStorageMethods.deleteAll();
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the field";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> signOut() async {
    String res = "Some error occured";
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> deleteUser({
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (password.isNotEmpty) {
        User firebaseUser = _firebaseAuth.currentUser!;
        String userEmail = firebaseUser.email!;

        await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail, password: password);
        await firebaseUser.delete();

        res = "success";
      } else {
        res = "Please enter a password";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> resetPassword({
    required String email,
  }) async {
    String res = "Some error occured";

    if (email.isEmpty) return "Please enter a email";
    if (!isEmailValid(email)) return "Please enter a valid email";

    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      res = "success";
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        res = "No record found of this mail";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
