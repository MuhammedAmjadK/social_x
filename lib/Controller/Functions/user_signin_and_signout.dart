import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_x/Models/Parameters/common_parameters.dart';
import 'package:social_x/Models/user_model.dart';
import 'package:social_x/Views/Screens/HomeScreen/home_screen.dart';
import 'package:social_x/Views/Screens/news_screen.dart';

final _auth = FirebaseAuth.instance;

loginUser(String email, String password, BuildContext context) async {
  try {
    var res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    userID = res.user!.uid;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((ctx) => const NewsScreen())));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'wrong-password') {
      passWordError = 'Wrong Password';
      loginFormkey.currentState!.validate();
    } else if (e.code == 'user-not-found') {
      emailError = 'Invalid Email/User not found';
      loginFormkey.currentState!.validate();
    } else if (e.code == 'too-many-requests') {
      passWordError = 'Too many attempts. Try later';
      loginFormkey.currentState!.validate();
    } else if (e.code == 'network-request-failed') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Network connection failed')));
    }
  }
}

googleLogin(BuildContext context) async {
  final googleUser = await GoogleSignIn().signIn();

  if (googleUser != null) {
    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    var res = await _auth.signInWithCredential(credential);

    userID = res.user!.uid;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((ctx) => const NewsScreen())));
  }
}

facebookLogin(BuildContext context) async {
  final facebookLoginResult = await FacebookAuth.instance.login();

  final accessToken = facebookLoginResult.accessToken;

  if (accessToken != null) {
    final credential = FacebookAuthProvider.credential(accessToken.token);

    var res = await _auth.signInWithCredential(credential);

    userID = res.user!.uid;

    loginFormkey.currentState!.reset();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((ctx) => const NewsScreen())));
  }
}

registerUser(String name, String email, String password, String contactNo,
    BuildContext context) async {
  try {
    var emailInfo = await _auth.fetchSignInMethodsForEmail(email);
    if (emailInfo.isEmpty) {
      var res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      userID = res.user!.uid;

      UserModel user = UserModel(
        id: userID!,
        name: name,
        email: email,
        password: password,
        contactNo: contactNo,
      );

      final reference =
          FirebaseFirestore.instance.collection('user').doc(userID);

      await reference.set(user.toJson());

      termAndConditionAccepted = false;
      signUpFormkey.currentState!.reset();

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NewsScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'This email address is already registered, Please go to login')));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'network-request-failed') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Network connection failed')));
    }
  }
}

signOutUser(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('LogOut'),
          titleTextStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: const Text('Are you sure you want to Logout'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
                await GoogleSignIn().signOut();
                await FacebookAuth.instance.logOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
          ],
        );
      });
}

resetPassword(String email, BuildContext context) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email was send to $email')));
    passwordResetFormkey.currentState!.reset();
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('User not found!')));
    } else if (e.code == 'network-request-failed') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Network connection failed')));
    }
  }
}
