import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipo_estrella/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

var logger = Logger();

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<void> build() {
    logger.i("Building AuthController");
    return Future.value();
  }

  // For Authentication related functions you need an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //  This getter will be returning a Stream of User object.
  //  It will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  // Now This Class Contains 3 Functions currently
  // 1. signInWithGoogle
  // 2. signOut
  // 3. signInwithEmailAndPassword

  //  All these functions are async because this involves a future.
  //  if async keyword is not used, it will throw an error.
  //  to know more about futures, check out the documentation.
  //  https://dart.dev/codelabs/async-await
  //  Read this to know more about futures.
  //  Trust me it will really clear all your concepts about futures

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        logger.i('Email already in use.');
      } else {
        logger.i('Error: $e');
      }
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Future<UserModel> getUserProfile(email) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   final user = await db.collection("user").get(email);
  //   final userInfo = user
  //   //final newsList = news.docs.map((doc) => doc.data()).toList();
  //   return newsList.map((e) => NewsModel.fromMap(e)).toList();
  // }

  Future<void> createUserProfile(String name, String lastname, String email) {
    var userId = _auth.currentUser?.uid;

    if (userId == null) {
      logger.e("User not logged in");
      return Future.value();
    }

    UserModel newUser = UserModel(
        name: name,
        lastname: lastname,
        email: email,
        favVolunteerings: [],
        id: userId);
    FirebaseFirestore db = FirebaseFirestore.instance;
    return db.collection("users").doc(userId).set(newUser.toJson());
  }
}
