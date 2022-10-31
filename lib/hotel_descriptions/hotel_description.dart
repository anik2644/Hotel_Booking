import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:untitled12/main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Facilities.dart';

Widget buildNavigationButton() => FloatingActionButton.extended(
    icon: Icon(Icons.book),
    label: Text("Book Now"),
    backgroundColor: Colors.black,
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

                  //4th Image of Slider
              /*
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.travelapi.com/hotels/10000000/9750000/9746600/9746513/9b331843_z.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
               */
                ],

                //Slider Container properties
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
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
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        height: 450,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            buttonSection(context),
                            Popular_facilities(),
                            description(),
                            SizedBox(height: 90,)
                          ],
                        ),
                      ),
                      Container(
                        child:  buildNavigationButton(),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
     //bottomNavigationBar: ,
    //  backgroundColor: Colors.white,
      //bottomNavigationBar:  buildNavigationButton(),
      //floatingActionButton: buildNavigationButton(),
    );
  }
}


/*
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
*/
/*
class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Container(),
    ));
    throw UnimplementedError();
  }
}
*/