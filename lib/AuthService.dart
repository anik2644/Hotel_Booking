//Determine if the user is authenticated.

//<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
//=======
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'LoginPage.dart';
import 'home_page.dart';
//<<<<<<< HEAD
import 'models/ChatMessage.dart';
//=======
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f



class AuthService{


  static String x=  FirebaseAuth.instance.currentUser!.displayName!;
  static String y=  FirebaseAuth.instance.currentUser!.email!;
  static String z= FirebaseAuth.instance.currentUser!.photoURL!;


//<<<<<<< HEAD
 static String? Profilepicurl= "https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg" ;
//=======
 //static String? Profilepicurl= "https://commons.wikimedia.org/wiki/File:A_black_image.jpg" ; //z.isNotEmpty? z: "https://commons.wikimedia.org/wiki/File:A_black_image.jpg" ;
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f
 static String name = "nothing"; //x.isNotEmpty? x:"nothing";
 static String email = "nothing"; //y.isNotEmpty? y: "nothing";// FirebaseAuth.instance.currentUser!.email!;
 static bool is_login=  name== "nothing" ? false : true;  //false;



//<<<<<<< HEAD
  static String? adminProfilepicurl= "https://lh3.googleusercontent.com/a/ALm5wu1Nx5jn2mTV8M1M157ym8VCUglZacHP9ECEt4gInA=s96-c" ;
  static String? friendProfilepicurl= "https://lh3.googleusercontent.com/a/ALm5wu1Nx5jn2mTV8M1M157ym8VCUglZacHP9ECEt4gInA=s96-c" ;

  static List<ChatMessage> ddemeChatMessages = [];

  static var chatdocid;
  static var friendUid= "admin";
  static var currentUserId;//= AuthService.email;

//=======
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f


  AuthService()
  {

  }


  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot)  {
          if (snapshot.hasData) {

            print("i have been come");


            AuthService.is_login =true;
            AuthService.name =   FirebaseAuth.instance.currentUser!.displayName!;
            AuthService.email =   FirebaseAuth.instance.currentUser!.email!;

            AuthService.currentUserId= AuthService.email;
            // currentUserId=  AuthService.email;
            // FetchMEssage();

            return HomePage();
          } else {
            AuthService.currentUserId= AuthService.email;
            print("It is really beautiful");
            return const  GoogleSignInApp();  //LoginPage();
          }
        });
  }


/*
 handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
//<<<<<<< HEAD
        builder: (BuildContext context, snapshot)  {
          if (snapshot.hasData) {
            
            print("i have been come");


            AuthService.is_login =true;
            AuthService.name =   FirebaseAuth.instance.currentUser!.displayName!;
            AuthService.email =   FirebaseAuth.instance.currentUser!.email!;

            AuthService.currentUserId= AuthService.email;
           // currentUserId=  AuthService.email;
            // FetchMEssage();

            return HomePage();
          }
          else {
            AuthService.currentUserId= AuthService.email;
//=======
            builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            
            print("i have been come");
            return HomePage();
          } else {
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f
            print("It is really beautiful");
            return const  GoogleSignInApp();  //LoginPage();
          }

  }
          }

    );
  }
*/
//<<<<<<< HEAD
  static FetchMEssage() async {

    print("this is fetch ");
    await FirebaseFirestore.instance.collection("adminchats").where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .get().then((value) => {
      chatdocid= value.docs.single.id,
      value.docs.forEach((result) {
        print(result.data());
        FirebaseFirestore.instance.collection("adminchats")
            .doc(chatdocid)
            .collection("messages").orderBy('createdOn',  descending: false)
            .get()
            .then((subcol) =>
        {


          subcol.docs.forEach((element) {
            var data;
            data= element.data();


            ddemeChatMessages.add(ChatMessage( data["msg"].toString() ,ChatMessageType.text,MessageStatus.viewed, data["uid"]==AuthService.email ? true : false));

            //ChatMessage();
            // print(msge.text);
            // print(msge.isSender);
            // ddemeChatMessages.add(msge);
            print("hellon world");
            print(ddemeChatMessages.length);
            // print(result.id);
          })
        });
      })
    });
  }

//=======
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f


/*
  signInWithGoogle() async {


    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    
   // print("i am signout\n\n\n\n\n\n\n\n\n\n\n\n");

    FirebaseAuth.instance.signOut();
  }

  Backpressed() {

   // Navigator.of(context).pop();

  }
*/

}
