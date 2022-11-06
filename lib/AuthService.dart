import 'package:cloud_firestore/cloud_firestore.dart';
//=======
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:untitled12/OfferPage.dart';
import 'package:untitled12/account/profile.dart';
import 'package:untitled12/account/signin_page.dart';
import 'package:untitled12/bodyFavorite.dart';
import 'package:untitled12/main.dart';

import 'LoginPage.dart';
import 'home_page.dart';
//<<<<<<< HEAD
import 'models/ChatMessage.dart';

class AuthService {
  static String x = FirebaseAuth.instance.currentUser!.displayName!;
  static String y = FirebaseAuth.instance.currentUser!.email!;
  static String z = FirebaseAuth.instance.currentUser!.photoURL!;
  static int indx = 0;
  static String? Profilepicurl =
      "https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg";
  static String name = "nothing";
  static String email = "nothing";
  static bool is_login = name == "nothing" ? false : true; //false;

  static String? adminProfilepicurl =
      "https://cdn-icons-png.flaticon.com/512/709/709722.png?w=740&t=st=1667025404~exp=1667026004~hmac=991c145c6bdf43e1336c6a5fa3a89b8422d8acbacf2e2467df109a9b3750ffd0";
  static String? friendProfilepicurl =
      "https://lh3.googleusercontent.com/a/ALm5wu1Nx5jn2mTV8M1M157ym8VCUglZacHP9ECEt4gInA=s96-c";
  static List<ChatMessage> ddemeChatMessages = [];
  static var chatdocid;
  static var friendUid = "admin";
  static var currentUserId; //= AuthService.email;
  AuthService() {}

  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            print("i have been come");

            AuthService.is_login = true;
            AuthService.name = FirebaseAuth.instance.currentUser!.displayName!;
            AuthService.email = FirebaseAuth.instance.currentUser!.email!;
            AuthService.currentUserId = AuthService.email;
            AuthService.Profilepicurl =
                FirebaseAuth.instance.currentUser!.photoURL!;
            // currentUserId=  AuthService.email;
            // FetchMEssage();

            return Profile(); //HomePage();
          } else {
            AuthService.currentUserId = AuthService.email;
            print("It is really beautiful");
            return SignIn(); // const  GoogleSignInApp(); //SignIn();//const  //GoogleSignInApp();  //LoginPage();
          }
        });
  }

  static FetchMEssage() async {
    print("this is fetch ");
    await FirebaseFirestore.instance
        .collection("adminchats")
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .get()
        .then((value) => {
              chatdocid = value.docs.single.id,
              value.docs.forEach((result) {
                FirebaseFirestore.instance
                    .collection("adminchats")
                    .doc(chatdocid)
                    .collection("messages")
                    .orderBy('createdOn', descending: false)
                    .get()
                    .then((subcol) => {
                          subcol.docs.forEach((element) {
                            var data;
                            data = element.data();
                            ddemeChatMessages.add(ChatMessage(
                                data["msg"].toString(),
                                ChatMessageType.text,
                                MessageStatus.viewed,
                                data["uid"] == AuthService.email
                                    ? true
                                    : false));
                            print("hellow world");
                            print(ddemeChatMessages.length);
                            // print(result.id);
                          })
                        });
              })
            });
  }

  static AddFavourite() async {
    var chatDocId = AuthService.email;
    CollectionReference COl =
        FirebaseFirestore.instance.collection('favourites');
    List<dynamic> fav = [];

    await COl.doc(chatDocId).get().then((value) => {
          if (value.data() == null)
            {
              // var Ls= [],
              print("need data"),
              COl.doc(chatDocId).set({
                'index': FieldValue.arrayUnion(bodyFavorite.favList),
                'name[1]': "Mahmud",
              }),
            }
          else
            {
              COl.doc(chatDocId).update({
                'index': FieldValue.arrayUnion(bodyFavorite.favList),
                //'name[1]': "Mahmud",
              }),
            }
        });
  }

  static FetchFavourite() async {
    var chatDocId = AuthService.email;
    List<dynamic> fav = [];
    CollectionReference COl =
        FirebaseFirestore.instance.collection('favourites');

    await COl.doc(chatDocId).get().then((value) => {
          if (value.data() == null)
            {print("need data")}
          else
            {
              //print(value.data())
              fav = value["index"],
              print(fav[0]),

              for (int i = 0; i < fav.length; i++)
                {bodyFavorite.favList.add(fav[i])}
            }
        });
  }

  static FetchOffers() async {


    var image;
    var promo;
    CollectionReference COl = FirebaseFirestore.instance.collection('offers');
    await COl.get().then((value) => {

      value.docs.forEach((element) {
        //image = element["image"];
        //print(image.toString());

        OfferPage.offer_middle.add(new Off(element["image"],element["promoCode"]));

        })
      /*
      if (value.data() == null){
          print("need data")}
      else
        {
          //print(value.data())
          image = value["image"],
          print(image.toString()),

          //
          // for (int i = 0; i < fav.length; i++)
          //   {bodyFavorite.favList.add(fav[i])}
        }

       */
    });

    CollectionReference SuCOl = FirebaseFirestore.instance.collection('staticImage');
    await SuCOl.get().then((value) => {

      value.docs.forEach((element) {
        //image = element["image"];
        //print(image.toString());

        OfferPage.offer_static.add(element["image"]);

      })
      /*
      if (value.data() == null){
          print("need data")}
      else
        {
          //print(value.data())
          image = value["image"],
          print(image.toString()),

          //
          // for (int i = 0; i < fav.length; i++)
          //   {bodyFavorite.favList.add(fav[i])}
        }

       */
    });


    CollectionReference SubCOl = FirebaseFirestore.instance.collection('hotelOffers');
    await SubCOl.get().then((value) => {

      value.docs.forEach((element) {

        OfferPage.offer_hotel.add(new HotelOff(element["image"].toString(),element["name"].toString()));

      })
      /*
      if (value.data() == null){
          print("need data")}
      else
        {
          //print(value.data())
          image = value["image"],
          print(image.toString()),

          //
          // for (int i = 0; i < fav.length; i++)
          //   {bodyFavorite.favList.add(fav[i])}
        }

       */
    });



  }
}
