import 'package:flutter/material.dart';
import 'package:untitled12/AuthService.dart';
import 'package:untitled12/main.dart';


import 'package:untitled12/hotel_descriptions/hotel_description.dart';


class Off {
  String image;
  String promocode;

  Off(this.image, this.promocode);
}

class HotelOff {
  String image;
  String name;

  HotelOff(this.image, this.name);
}

class OfferPage extends StatefulWidget {
  static List<Off> offer_middle = [];
  static List<String> offer_static = [];
  static List<HotelOff> offer_hotel = [];
  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  void initState() {
    if (OfferPage.offer_middle.length == 0) AuthService.FetchOffers();
/*
    for(int i=0;i<OfferPage.offer_middle.length;i++)
      {
        print(OfferPage.offer_middle[i].image);
        print(OfferPage.offer_middle[i].promocode);
      }
*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Offers")),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250.0,
            color: Colors.black54,
            margin: EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: OfferPage.offer_middle.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(OfferPage.offer_middle[index].promocode),
                          content: Text('Use this code for 50% off.'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK')),
                          ],
                        );
                      });
                },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: NetworkImage(
                          OfferPage.offer_middle[index].image.toString()),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            /*  ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                //container to clickable inkwell

                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(OfferPage.offer_middle[0].promocode),
                            content: Text('Use this code for 50% off.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK')),
                            ],
                          );
                        });
                    },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                        image: NetworkImage(OfferPage.offer_middle[0].image.toString()),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(OfferPage.offer_middle[1].promocode),
                            content: Text('Use this code for 50% off.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK')),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                        image: NetworkImage(OfferPage.offer_middle[1].image.toString()),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(OfferPage.offer_middle[2].promocode),
                            content: Text('Use this code for 50% off.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK')),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                        image: NetworkImage(OfferPage.offer_middle[2].image.toString()),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(OfferPage.offer_middle[3].promocode),
                            content: Text('Use this code for 50% off.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK')),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                        image: NetworkImage(OfferPage.offer_middle[3].image.toString()),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(OfferPage.offer_middle[4].promocode),
                            content: Text('Use this code for 50% off.'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('OK')),
                            ],
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                        image: NetworkImage(OfferPage.offer_middle[4].image.toString()),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                /*
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/b.jpg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/c.png"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/d.jpeg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/e.jpeg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                 */
              ],
            ), */
          ),
          Container(
            color: Colors.black26,
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: OfferPage.offer_hotel.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  int j = -1;
                  for (int i = 0; i < Myapp.hotelList.length; i++) {
                    if (Myapp.hotelList[i].name
                        .contains(OfferPage.offer_hotel[index].name)) {
                      j = i;
                      break;
                    }
                  }

                  Myapp.selectedHotel = j;
                  print(Myapp.selectedHotel);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => hotel_description()));
                },
                /*
                  print(j);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(OfferPage.offer_hotel[index].name),
                          content: Text('Use this code for 50% off.'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('OK')),
                          ],
                        );
                      });

                   */
                //  },
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: NetworkImage(
                          OfferPage.offer_hotel[index].image.toString()),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            /*
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/a2.jpeg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/b2.jpeg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/c2.jpeg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/d2.jpg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image(
                      image: AssetImage("assets/e2.jpg"),
                      height: 200.0,
                      width: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

             */
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
              child: Image(
                image: NetworkImage(OfferPage.offer_static[0].toString()),
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
              child: Image(
                image: NetworkImage(OfferPage.offer_static[1].toString()),
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
