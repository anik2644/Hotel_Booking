
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled12/LoginPage.dart';
import 'package:untitled12/bodyFavorite.dart';
import 'AuthService.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String? Profilepicurl= FirebaseAuth.instance.currentUser!.photoURL;

  String name =   FirebaseAuth.instance.currentUser!.displayName!;
  String email =   FirebaseAuth.instance.currentUser!.email!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

           Text(
              FirebaseAuth.instance.currentUser!.displayName!,
            // "anik",
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),

            Text(
              FirebaseAuth.instance.currentUser!.email!,
              //"mahmud",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(
              height: 30,
            ),


            Image.network(Profilepicurl.toString(), height: 100, width: 100),


            MaterialButton(padding: const EdgeInsets.all(10), color: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), child: const Text('LOG OUT', style: TextStyle(color: Colors.white, fontSize: 15),),
              onPressed: () async {


                bodyFavorite.f=1;
                AuthService.name= "nothing";
                AuthService.email= "nothing";
                AuthService.Profilepicurl= "https://commons.wikimedia.org/wiki/File:A_black_image.jpg";
                AuthService.is_login= false;
                await _googleSignIn.signOut();
                FirebaseAuth.instance.signOut();

               // AuthService().signOut();
              },
            ),
            MaterialButton(
              padding: const EdgeInsets.all(10),
              color: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Text('Back', style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: () {

                AuthService.name= this.name;
                AuthService.email=this.email;
                AuthService.Profilepicurl= this.Profilepicurl;
                AuthService.is_login= true;

                AuthService.name =  FirebaseAuth.instance.currentUser!.displayName!;
                AuthService.email=  FirebaseAuth.instance.currentUser!.email!;
                AuthService.Profilepicurl  = FirebaseAuth.instance.currentUser!.photoURL!;

                Navigator.of(context).pop();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Myapp()),//AccountPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}