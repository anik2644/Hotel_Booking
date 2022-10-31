
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/screens/chats/chats_screen.dart';

import 'ChatPage.dart';
import 'HistoryPage.dart';
import 'LoginPage.dart';
import 'OfferPage.dart';

class Bottom1 extends StatefulWidget {
  const Bottom1({Key? key}) : super(key: key);

  @override
  State<Bottom1> createState() => _Bottom1State();
}

class _Bottom1State extends State<Bottom1> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,


// currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.chat),
            onPressed:  (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ChatsScreen(),),
              );
            },
          ),
          label: 'Chat',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.shopping_basket_sharp),
            onPressed:  (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  OfferPage()),
              );
            },
          ),
          label: 'Offers',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.history),
            onPressed:  (){

              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HistoryPage()),
              );
            },
          ),
          label: 'History',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed:  (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AuthService().handleAuthState()),//AccountPage()),
              );
            },
          ),
          label: 'Account',
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}

