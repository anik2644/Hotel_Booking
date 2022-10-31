
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/main.dart';

import '../../constants.dart';
import '../../models/ChatMessage.dart';
import 'components/body.dart';

class MessagesScreen extends StatefulWidget {


  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  //var chatdocid;

  @override
  void initState() {
    super.initState();
    //checkUser();
  //  AuthService.ddemeChatMessages.clear();

    if(AuthService.ddemeChatMessages.length==0)
     AuthService.FetchMEssage();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: RefreshIndicator(
        // key: refreshKey,
        child: Body(),
        onRefresh: () async {
          await refreshList();
         },
      ),
      // Body(),
    );
  }
  Future<Null> refreshList()
  async {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => MessagesScreen()));
/*
   int flag=0;
    int t= AuthService.ddemeChatMessages.length;
    //AuthService.ddemeChatMessages.clear();


   print("in refresh function");

    if(AuthService.ddemeChatMessages.length==0)
      {
        print("come with zero");
      //  await AuthService.FetchMEssage();
      }
print(AuthService.ddemeChatMessages.length);

    /*
    while(flag==0) {
      if (AuthService.ddemeChatMessages.length != 0) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => MessagesScreen()));
        flag = 1;
        print('fetchdone');
      }
      else {

        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) => MessagesScreen()));
        flag++;
        print('flaag');
      }
    }

     */
    /*
    await FirebaseFirestore.instance.collection("adminchats").where('users', isEqualTo: {AuthService.friendUid: null, AuthService.currentUserId: null})
        .get().then((value) => {
      AuthService.chatdocid= value.docs.single.id,
      value.docs.forEach((result) {
        print(result.data());
        FirebaseFirestore.instance.collection("adminchats").doc(AuthService.chatdocid)
            .collection("messages").orderBy('createdOn',  descending: false).get().then((subcol) =>
        {
          subcol.docs.forEach((element) {
            var data;
            data= element.data();
            //AuthService.ddemeChatMessages.add(ChatMessage( data["msg"].toString() ,ChatMessageType.text,MessageStatus.viewed, data["uid"]==AuthService.email ? true : false));
          })
        });
      })
    });

   */
*/
  }
  AppBar buildAppBar() {
    return AppBar(
      /* leading: BackButton(
        onPressed: (){
          AuthService.ddemeChatMessages.clear();
          AuthService.FetchMEssage();
         // Navigator.push(context,MaterialPageRoute(builder: (context) =>FunctioN()));

        },
      ),*/
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      leading: BackButton(
        onPressed: (){
          AuthService.ddemeChatMessages.clear();
          Navigator.pop(context);
        },
      ),

      title: Row(

       // mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: [
         // DecorationPosition.background= Colors.black,
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(AuthService.adminProfilepicurl.toString(),),

          ),
          SizedBox(width: kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                 "Admin" , //  AuthService.name,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active now",
                style: TextStyle(fontSize: 12, ),
              )
            ],
          )
        ],
      ),
      actions: [
        /*
        IconButton(
          icon: Icon(Icons.local_phone),
          onPressed: () {

            AuthService.ddemeChatMessages.clear();
            AuthService.FetchMEssage();

          },
        ),*/
        IconButton(

          icon: Icon(Icons.refresh_sharp),
          onPressed: () {
            AuthService.ddemeChatMessages.clear();

            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (BuildContext context) => MessagesScreen()));

            /*

            FirebaseFirestore.instance.collection("adminchats").where('users', isEqualTo: {AuthService.friendUid: null, AuthService.currentUserId: null})
                .get().then((value) => {
              chatdocid= value.docs.single.id,
              value.docs.forEach((result) {
                print(result.data());
                FirebaseFirestore.instance.collection("adminchats")
                    .doc(chatdocid)
                    .collection("messages").orderBy('createdOn', descending: true)
                    .get()
                    .then((subcol) =>
                {


                  subcol.docs.forEach((element) {
                    var data;
                    data= element.data();
                    // AuthService.ddemeChatMessages.add(ChatMessage( data["msg"].toString() ,ChatMessageType.text,MessageStatus.viewed, data["uid"]==AuthService.email ? true : false));

                    //ChatMessage();
                    // print(msge.text);
                    // print(msge.isSender);
                    // ddemeChatMessages.add(msge);
                    print("My_world");
                    print(AuthService.ddemeChatMessages.length);
                    // print(result.id);
                  })
                });
              })
            });


             */

          },
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],

    );
  }
}