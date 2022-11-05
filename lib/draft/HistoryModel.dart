import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/bodyFavorite.dart';
import 'package:untitled12/main.dart';

import 'package:untitled12/hotel_descriptions/hotel_description.dart';

import '../models/Hotel.dart';
//import 'hotel_model.dart';

class History_model extends StatefulWidget {
  static List<int> His = [];

  @override
  State<History_model> createState() => _History_modelState();
}

class _History_modelState extends State<History_model> {

  List<Hotel> display_list = List.from(Myapp.hotelList);
   static List<int> hist=[];

  @override
  void initState() {
    // TODO: implement initState
    updateList();
    super.initState();
  }

  void updateList() {
    print(History_model.His);
    hist = History_model.His.toSet().toList();
    //var reversedList = new List.from(myList.reversed);

    hist = List.from(hist.reversed);
    display_list.clear();

    for(int i=0;i<hist.length;i++)
      {
        display_list.add(Myapp.hotelList[hist[i]]);

      }
    print(hist);

  }

  @override
  Widget build(BuildContext context) {
     return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: display_list.length == 0
                    ? Center(
                  child: Text(
                    "No result found",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                )
                    : ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context, index) => GestureDetector(

                    onTap: () {
                      Myapp.selectedHotel= hist[index];
                      print(Myapp.selectedHotel);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => hotel_description()));
                    },
                    child: Column(
                      children: [
                        ListTile(
                          tileColor: Colors.black26,
                          contentPadding: EdgeInsets.all(8),
                          title: Text(
                            display_list[index].name!,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${display_list[index].location!}',
                            style: TextStyle(color: Colors.black),
                          ),
                          leading: Container(
                              height:50 ,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:NetworkImage(
                                        display_list[index].x!),
                                  )
                                ),

                          ),
                          trailing: FavoriteButton(
                            isFavorite: bodyFavorite.favList.contains(hist[index]) ?true : false,
                            // iconDisabledColor: Colors.white,
                            valueChanged: (_isFavorite) {

                              bodyFavorite.favList.add(hist[index]);
                              print('Is Favorite : $_isFavorite');
                              AuthService.AddFavourite();

                            },
                          ),
                  ),
                        SizedBox(height: 25,)
                      ],
                    ),
                )
                )
            )],
        ),
      );
   // );
  }
}
