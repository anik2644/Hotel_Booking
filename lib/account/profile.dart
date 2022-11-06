import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/account/signin_page.dart';
import 'package:untitled12/bodyFavorite.dart';
import 'package:untitled12/main.dart';

import 'editPage.dart';

class Profile extends StatefulWidget {
  var name = 'Sabbir Ahmed';
  var email = 'sabbir.rzs17@gmail.com';
  static var cell = '';
  static var location = '';
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

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
        title: Center(child: Text("User Account")),
        backgroundColor: Colors.black,

      ),
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 10,
          ),
          _profileName(AuthService.name),
          SizedBox(
            height: 14,
          ),
          _heading("Personal Details"),
          SizedBox(
            height: 6,
          ),
          _detailsCard(),
          SizedBox(
            height: 10,
          ),
          //_heading("Settings"),
          SizedBox(
            height: 6,
          ),
          EditPage(),
          Spacer(),
          logoutButton()
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        AuthService.Profilepicurl.toString()
                       // "https://as1.ftcdn.net/v2/jpg/02/09/95/42/1000_F_209954204_mHCvAQBIXP7C2zRl5Fbs6MEWOEkaX3cA.jpg"))
                // color: Colors.orange[100],
                    ))),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(AuthService.email),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black,
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(Profile.cell),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black,
            ),
            Card(
                child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text(Profile.location),
            ))
          ],
        ),
      ),
    );
  }

  Widget EditPage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => editPage()),
                );
              },
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text("Edit Profile"),
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return InkWell(
      onTap: () async {


        GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
        GoogleSignInAccount? user =_googleSignIn.currentUser;

        await _googleSignIn.signOut();
        FirebaseAuth.instance.signOut();
        AuthService.is_login=false;


        bodyFavorite.favList.clear();
        //AuthService.FetchFavourite();

        setState((){

          print(user!.email);
          print("sign out done\n\n\n");

        });

        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));


      },
      child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }
}
