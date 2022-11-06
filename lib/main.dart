import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/Body.dart';
import 'package:untitled12/Drawer.dart';
import 'package:untitled12/models/Hotel.dart';
import 'BottomBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bodyFavorite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FunctioN());
}

class FunctioN extends StatefulWidget {
  const FunctioN({Key? key}) : super(key: key);

  @override
  State<FunctioN> createState() => _FunctioNState();
}

class _FunctioNState extends State<FunctioN> {
  get drawer => null;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
   Myapp({Key? key}) : super(key: key);

  static int selectedHotel = 0;
  static List<Hotel> hotelList = [
    Hotel("01635498133",
      "Coxs Bazaar, Bangladesh",
      "Coxs Bazaar, Bangladesh",
      "Hotel Sea Crown",
      "Coxs Bazaar, Bangladesh",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
    ),
    Hotel("01572555945",
      "Srinagar,India",
      "Srinagar,India",
      "Hotel Grand Mahal",
      "Srinagar,India",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
    ),
    Hotel("01797105243",
      "Singapore",
      "Singapore",
      "Skylight Homez",
      "Singapore",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png",
    ),
    Hotel("01521756345",
      "Dubai",
      "Dubai",
      "The Royal Mount",
      "Dubai",
      "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
    ),
    Hotel("01408343989",
      "Bangladesh",
      "Bangladesh",
      "Hotel Niharika",
      "Bangladesh",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",


    ),

  ];

  List<Hotel>display_list = List.from(hotelList);




  static FetchHotel() async {
    // print("this is fetch ");
    await FirebaseFirestore.instance.collection("hotel").get().then((value) => {
          value.docs.forEach((result) {
            //print(result.data());
            var data;
            List<dynamic> img;

            data = result.data();
            img = data["image"];
            //  hotelList.add(Hotel(data[], description, airport, bar, benchpoint, parking, restaurant, wifi, x, y, z))
            hotelList.add(new Hotel(
                data["phoneNumber"].toString(),
                data["location"].toString(),
                data["address"].toString(),
                data["name"].toString(),
                data["description"].toString(),
                img[0].toString(),
                img[1].toString(),
                img[2].toString()));

          })
        });
  }

  @override
  initState() {
    if (Myapp.hotelList.length <7)
      {


        if(FirebaseAuth.instance.currentUser==null)
        {
          print("object");
        }
        else
        {
          print("ssobject");

          AuthService.is_login =true;
          AuthService.name =   FirebaseAuth.instance.currentUser!.displayName!;
          AuthService.email =   FirebaseAuth.instance.currentUser!.email!;
          AuthService.currentUserId= AuthService.email;
          AuthService.Profilepicurl =  FirebaseAuth.instance.currentUser!.photoURL!;

          bodyFavorite.favList.clear();
          AuthService.FetchFavourite();

          AuthService.FetchMEssage();
          AuthService.FetchOffers();
        }

        Myapp.FetchHotel();


      }
  }

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();


  static List<Hotel> hotelList = [
    Hotel("01635498133",
      "Coxs Bazaar, Bangladesh",
      "Coxs Bazaar, Bangladesh",
      "Hotel Sea Crown",
      "Coxs Bazaar, Bangladesh",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
    ),
    Hotel("01572555945",
      "Srinagar,India",
      "Srinagar,India",
      "Hotel Grand Mahal",
      "Srinagar,India",
      "https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
    ),
    Hotel("01797105243",
      "Singapore",
      "Singapore",
      "Skylight Homez",
      "Singapore",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png",
    ),
    Hotel("01521756345",
      "Dubai",
      "Dubai",
      "The Royal Mount",
      "Dubai",
      "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
    ),
    Hotel("01408343989",
      "Bangladesh",
      "Bangladesh",
      "Hotel Niharika",
      "Bangladesh",
      "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
      "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
      "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",


    ),

  ];
  List<Hotel>display_list = List.from(hotelList);

  void updateList(String value) {
    setState(() {
      display_list = hotelList
          .where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
            key: refreshKey,
            child: Mybody(),
            onRefresh: () async {
              await refreshList();
            }), // Mybody(),

        drawer: Mydrawer(),

        bottomNavigationBar: Bottom1(),
      ),
    );
  }

  refreshList() {

    if (Myapp.hotelList.length <7)
      {

        if(FirebaseAuth.instance.currentUser==null)
        {
          print("No initial Login Info");
        }
        else
        {
          print("ssobject");

          AuthService.is_login =true;
          AuthService.name =   FirebaseAuth.instance.currentUser!.displayName!;
          AuthService.email =   FirebaseAuth.instance.currentUser!.email!;
          AuthService.currentUserId= AuthService.email;
          AuthService.Profilepicurl =  FirebaseAuth.instance.currentUser!.photoURL!;

          bodyFavorite.favList.clear();
          AuthService.FetchFavourite();
          AuthService.FetchMEssage();
          AuthService.FetchOffers();

        }
        Myapp.FetchHotel();
      }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => Myapp()));
  }
}
