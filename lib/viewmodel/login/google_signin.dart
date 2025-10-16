import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Sign in google and get access token to read and write on drive
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/drive.file',
  ],
);


Future<String?> signInAndGetAccessToken() async {
  final account = await _googleSignIn.signIn();
  final auth = await account?.authentication;
  return auth?.accessToken;
}