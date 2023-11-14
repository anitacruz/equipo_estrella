import 'package:equipo_estrella/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//  This is how you create a provider in Riverpod. Note the syntax may change in near future.
//  This is a provider which provides all the features of Authentication class we have created

//  The syntax is pretty simple.
//  you are using a Class Provider and specifiying the type of provider.
//  now this takes a function takes a providerreference ref as a parameter
//  this ref can you used to access a provider within a provider.
//  if you are not using a provider within a provdier, no worries. It's not compulosry.
//  you can use a provider without a provider.

final authenticationProvider = Provider<AuthenticationController>((ref) {
  return AuthenticationController();
});

//  Here I have shared the example of a provider used within a provider.
// keep in mind I am reading a provider from a provider not watching it.
//  The docs mention not to use watch in a provider. This is bad for performance
//  if the data changes continuously your app will suck bad

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
