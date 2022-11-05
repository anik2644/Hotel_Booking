import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';

import 'package:untitled12/hotel_descriptions/hotel_description.dart';
import 'package:untitled12/main.dart';
import 'package:untitled12/models/Hotel.dart';

class bodyFavorite extends StatefulWidget {
  static List<int> favList = [];

  static int f=1;

  @override
  State<bodyFavorite> createState() => _bodyFavoriteState();
}

class _bodyFavoriteState extends State<bodyFavorite> {
  List<Hotel> display_list1 = List.from(Myapp.hotelList);
  static List<int> hist1 = [];


  @override
  void initState() {
    // TODO: implement initState
    updateList();
    ref();
    super.initState();

  }

  void updateList() {
    print(bodyFavorite.favList);

    hist1 = bodyFavorite.favList.toSet().toList();
    //var reversedList = new List.from(myList.reversed);

    hist1 = List.from(hist1.reversed);
    display_list1.clear();

    for (int i = 0; i < hist1.length; i++) {
      display_list1.add(Myapp.hotelList[hist1[i]]);
    }
    print(hist1);
  }

  GlobalKey<RefreshIndicatorState> refreshKey =
  GlobalKey<RefreshIndicatorState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
           //backgroundColor: Colors.white60,//Color(0xFF1f1545),
          backgroundColor: Colors.black54,
          appBar: AppBar(
            leading: BackButton(color: Colors.white,),
            backgroundColor: Colors.black,
            title: Center(
              child: Text("Favourite",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ),

          body: RefreshIndicator(

            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: display_list1.length == 0
                          ?
                      Center(
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              "No result found",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                          :
                      ListView.builder(
                          itemCount: display_list1.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Myapp.selectedHotel = index;
                              print(Myapp.selectedHotel);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          hotel_description()));
                            },
                            child: Column(

                              children: [

                                ListTile(
                                  contentPadding: EdgeInsets.all(8),
                                  tileColor: Colors.black54,
                                  title: Text(
                                    display_list1[index].name!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${display_list1[index].location!}',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              display_list1[index].x!),
                                        )),
                                  ),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ),
                          )))
                ],
              ),
            ),
            key: refreshKey,
            onRefresh: () async {
              print("refresh done");
              await ref();
            },

          )),
    );
  }

  // List<Hotel> display_list = List.from(Myapp.hotelList);void updateList(String value) {
  //   setState(() {
  //     display_list = Myapp.hotelList
  //         .where((element) =>
  //         element.name!.toLowerCase().contains(value.toLowerCase()))
  //         .toList();
  //   });
  // }
/*
  GestureDetector MyArticles(String imageVal, String hotelname, String hotellocation,int index)
    return GestureDetector(
      onTap: () {
        Myapp.selectedHotel= index;
        print(Myapp.selectedHotel);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => hotel_description()));
      },

      child: Container(
        width: 160.0,
        child: Card(
          child: Wrap(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.width/2 ,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        imageVal
                    ),
                    fit: BoxFit.cover,),// child: Image.network(imageVal)
                ),


              ),

              ListTile(
                title: Text(hotelname),
                subtitle: Text(hotellocation),
              ),
            ],
          ),
        ),

      ),
    );
    }
 */

/*
  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
//floating: true,
// pinned: true,
// snap: false,
          centerTitle: true,
          title: const Text('Favorites',style: TextStyle(fontSize: 25),),


        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                //margin: EdgeInsets.all( 10.0),
                height: 900,
                child:  ListView.builder(
                  itemCount: bodyFavorite.favList.length,
                  itemBuilder: (context, index) => MyArticles(
                      bodyFavorite.favList[index].x,
                     bodyFavorite. favList[index].name,
                      "Coxs Bazaar, Bangladesh",1

                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

 */

  Future<void> ref() async {

    print("i have come to ref function");
    if (bodyFavorite.favList.isEmpty|| bodyFavorite.f ==1) {
      bodyFavorite.f=0;
      bodyFavorite.favList.clear();
      await AuthService.FetchFavourite();
    }
  }
}
