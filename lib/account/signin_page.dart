import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/account/profile.dart';
import 'package:untitled12/bodyFavorite.dart';

import '../main.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Myapp()),//AccountPage()),
            );
          },
        ),
        backgroundColor: Colors.black,
        title: Text("Sign In",
          style: TextStyle(
            color: Colors.white
          ),),
      ),


      body: Center(
          //: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          Container(
          margin: EdgeInsets.all(10.0),
          child: new ClipRRect(
            borderRadius: new BorderRadius.circular(17.0),
            child: new Image(
              image: new AssetImage("assets/shelta.png"),
              height: 300.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),


              const SizedBox(
                height: 10,
              ),
              // Container(
              //   child: Image.asset('assets/images/shelta.png', height: 30.0,),
              // ),
              Container(
                margin: EdgeInsets.all(20),
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: InkWell(
                  onTap: () async {


                    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
                    GoogleSignInAccount? user =_googleSignIn.currentUser;

                    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

                    // Create a new credential
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth.accessToken,
                      idToken: googleAuth.idToken,

                    );


                    await FirebaseAuth.instance.signInWithCredential(credential);
                    AuthService.is_login =true;
                    AuthService.name =   FirebaseAuth.instance.currentUser!.displayName!;
                    AuthService.email =   FirebaseAuth.instance.currentUser!.email!;
                    AuthService.currentUserId= AuthService.email;
                    AuthService.Profilepicurl =  FirebaseAuth.instance.currentUser!.photoURL!;

                    bodyFavorite.favList.clear();
                    AuthService.FetchFavourite();
                   // bodyFavorite.f=1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AuthService().handleAuthState()),//AccountPage()),
                    );


                  },
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
