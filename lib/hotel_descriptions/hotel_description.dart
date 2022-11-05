import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:untitled12/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../AuthService.dart';
import '../models/Chat.dart';
import '../models/ChatMessage.dart';
import '../screens/messages/messageScreenForAllChatMembers.dart';
import 'Facilities.dart';

Widget buildNavigationButton() => FloatingActionButton.extended(
    icon: Icon(Icons.book),
    label: Text("Book Now"),
    backgroundColor: Colors.green,
    onPressed: () {
      print('press Done');
    });

class hotel_description extends StatefulWidget {
  var name = 'Hotel Sea Crown',
      location = '0.1 km from Kutum Bari Restaurant ,Coxs bazar';
  String description =
      'An elegantly designed hotel GRACE COX is now operating at Coxs Bazar. Having 70 rooms, the extraordinary interior with a splash of eye-catching rooms waiting for you. All the related services will be provided by the hotel looking after your comfortability and satisfaction during your stay with us. The hotel is located just close proximity to the Sughandha sea beach Point. The hotel has a live kitchen with another elegantly decorated Food and Beverage outlet to cater to your needs and kiddies food.An elegantly designed hotel GRACE COX is now operating at Coxs Bazar. Having 70 rooms, the extraordinary interior with a splash of eye-catching rooms waiting for you. All the related services will be provided by the hotel looking after your comfortability and satisfaction during your stay with us. The hotel is located just close proximity to the Sughandha sea beach Point. The hotel has a live kitchen with another elegantly decorated Food and Beverage outlet to cater to your needs and kiddies food.An elegantly designed hotel GRACE COX is now operating at Coxs Bazar. Having 70 rooms, the extraordinary interior with a splash of eye-catching rooms waiting for you. All the related services will be provided by the hotel looking after your comfortability and satisfaction during your stay with us. The hotel is located just close proximity to the Sughandha sea beach Point. The hotel has a live kitchen with another elegantly decorated Food and Beverage outlet to cater to your needs and kiddies food.';
  String H_name = 'Hotel Sea Crown';

  hotel_description({super.key});

  @override
  State<hotel_description> createState() => _hotel_descriptionState();
}

class _hotel_descriptionState extends State<hotel_description> {
  String get name => name;
  var hotel_number = '01572555945';
  var hotel_location = 'House#,road#,villege,town,country';
  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          Myapp.hotelList[Myapp.selectedHotel].name,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: CarouselSlider(
                items: [
                  //1st Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          Myapp.hotelList[Myapp.selectedHotel].x),
                            //"https://hotelseacrownbd.com/wp-content/uploads/2017/07/Presidential-Suite_Hotel-Sea-Crown_Cox-Bazar-14-570x400.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //2nd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          Myapp.hotelList[Myapp.selectedHotel].y
                          // "https://cf.bstatic.com/xdata/images/hotel/max1280x900/121123916.jpg?k=4c7205e458ef9d368d14ad4aacd8a45c394110e2b51f2de47a1ffb8d1765cfd6&o=&hp=1"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3rd Image of Slider
                  Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          Myapp.hotelList[Myapp.selectedHotel].z
                            //"https://i.travelapi.com/hotels/10000000/9750000/9746600/9746513/b36e79aa_z.jpg"
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  viewportFraction: 0.8,
                ),
              ),
            ),
             titleSection(),
            const SizedBox(
              width: double.infinity,
              height: 5,
            ),
            //ListView.builder(itemBuilder: itemBuilder),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: 400,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    //buttonSection,
                     Card(
                child:   Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    IconButton(

                      icon: Icon(

                        color: Colors.blue,

                        Icons.call,

                      ),

                      onPressed: () async {
                        FlutterPhoneDirectCaller.callNumber(Myapp.hotelList[Myapp.selectedHotel].cellNo);
                      },

                    ),

                    IconButton(

                      icon: Icon(

                        color: Colors.blue,

                        Icons.chat,

                      ),

                      onPressed: () {

                        chatsData = List.from(chatsData.reversed);
                        chatsData.add(  Chat(
                          name: Myapp.hotelList[Myapp.selectedHotel].name,
                          lastMessage: "Hi,Please let know about us",
                          image: Myapp.hotelList[Myapp.selectedHotel].x,
                          time: "",
                          isActive: true,
                        ),);

                        demeChatMessages.add(ChatListObject(Myapp.hotelList[Myapp.selectedHotel].name),);
                        chatsData = List.from(chatsData.reversed);
                        AuthService.indx= 0;//chatsData.length-1;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                messagesScreenForAllChatMembers(),
                          ),

                        );



                      },

                    ),

                    IconButton(

                      icon: Icon(

                        color: Colors.blue,

                        Icons.location_on,

                      ),

                      onPressed: () {
                        AlertDialog alert = AlertDialog(
                          title: Text('Location:'),
                          content: Text( Myapp.hotelList[Myapp.selectedHotel].location),
                        );
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },

                    ),

                  ],

                ),
              ),
                    Popular_facilities(),
                    description(),
                    SizedBox(
                      height: 90,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.book),
          label: Text("Book Now"),
          backgroundColor: Colors.green,
          onPressed: () {
            AlertDialog alert = AlertDialog(
              title: Text('Contact us for Booking:'),
              content: Text(hotel_number),
            );
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          })
    );
  }
}
