//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_6/screens/auth/login.dart';
//import 'package:flutter_application_6/screens/homepage.dart';
import 'package:flutter_application_6/screens/profilepicture.dart';
import 'package:flutter_application_6/widgets/background-image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

//import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final auth = FirebaseAuth.instance;

  late String email;

  late String password;
//  FirebaseAuth instance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //logo

      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          backgroundimage(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: Image(image: AssetImage('assets/logo.png')),
                  ),
                ),
                // text sign up
                SizedBox(
                  height: 2,
                ),
                Text(
                  'SIGN UP',
                  style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: (Color.fromARGB(255, 5, 77, 59))),
                ),

                SizedBox(
                  height: 15,
                ),
                //form
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 237, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                this.email = value;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                border: InputBorder.none,
                                hintText: 'PhoneNumber Or Email',
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 33,
                                )),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 237, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                this.password = value;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                border: InputBorder.none,
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 33,
                                )),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 240, 237, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                this.password = value;
                              });
                            },
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                border: InputBorder.none,
                                hintText: 'Re-enter Password',
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 33,
                                )),
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            Container(
                                height: 50,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 43, 165, 120),
                                    borderRadius: BorderRadius.circular(16)),
                                child: TextButton(
                                    onPressed: () async {
                                      try {
                                        await auth
                                            .createUserWithEmailAndPassword(
                                                email: this.email,
                                                password: this.password);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return LoginPage();
                                          },
                                        ));
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "لا يوجد اتصال بالانتر نت ")));
                                      }
                                    },
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ))),

                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signIn();
      // Sign in was successful, handle the user's data
      // For example, you can get user details using:
      // GoogleSignInAccount? user = googleSignIn.currentUser;
    } catch (error) {
      // Handle the sign-in error
      print('Error signing in: $error');
    }
  }
}
//  }
//}

//Function to handle Google sign-in
//void _signInWithGoogle() async {
//  GoogleSignIn googleSignIn = GoogleSignIn();
//  try {
//  await googleSignIn.signIn();
//    // Do something after sign-in, e.g., navigate to a new screen
//  } catch (error) {
//    print('Error signing in with Google: $error');
