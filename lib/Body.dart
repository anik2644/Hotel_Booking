import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled12/hotel_descriptions/hotel_description.dart';
import 'package:untitled12/main.dart';
import 'package:untitled12/models/Hotel.dart';

import 'Details_page.dart';
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f

class Mybody extends StatefulWidget {
  const Mybody({Key? key}) : super(key: key);

  @override
  State<Mybody> createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  List<Hotel> display_list = List.from(Myapp.hotelList);void updateList(String value) {
    setState(() {
      display_list = Myapp.hotelList
          .where((element) =>
          element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();

      /*
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => Myapp()));
*/
    });
  }

  

  GestureDetector MyArticles(String imageVal, String hotelname, String hotellocation,int index) {

    return GestureDetector(

      onTap: () {

        Myapp.selectedHotel= index;
        print(Myapp.selectedHotel);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => hotel_description()));
//>>>>>>> 59644ea8b91eeaedf805e8efd8cb3ab7c3db0d4f

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
                        //"https://www.exampledomain.com/images/background.jpg"
                    ),
                    fit: BoxFit.cover,),// child: Image.network(imageVal)
              ),
                 /*child:
                 ListTile(
                   title: Text(hotelname),
                   subtitle: Text(hotellocation),
                 ),
                 */

              ),

              ListTile(
                title: Text(hotelname),
                subtitle: Text(hotellocation),
              ),
            ],
          ),
        ),

         /* child: InkWell(
            onTap: () {}, // Handle your callback
            child: Ink(height: 100, width: 100, color: Colors.blue),
          ),

          child: GestureDetector(
            onTap: () {
              print("Click event on Container");
            },
            child: Container(.......),*/
         // )

      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
//floating: true,
// pinned: true,
// snap: true,
          centerTitle: true,
          title: const Text('Hotel Booking'),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            title: Container(
              width: double.infinity,
              height: 40,
              color: Colors.white,
              child:  Center(
                child: TextField(
                  onChanged: (value)=> updateList(value),

                  decoration: InputDecoration(
                    hintText: 'Search for something',
                    prefixIcon: Icon(Icons.search),
// suffixIcon: Icon(Icons.favorite)
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
        Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                height: MediaQuery.of(context).size.height,
                child:  Listview(),
            )// Column(
            ],
          ),
        ),
      ],
    );
  }


  Listview()
  {
    print("object");
    return ListView.builder(
      itemCount: display_list.length,
      itemBuilder:   (context, index) => MyArticles(
        /*
                          Myapp.hotelList[index].x,
                          Myapp.hotelList[index].name,

                         */
          display_list[index].x,
          display_list[index].name,
          "Coxs Bazaar, Bangladesh",index
        /*
                          chat: chatsData[index],
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    messagesScreenForAllChatMembers(),
                              ),
>>>>>>> anik23-10-2022chatting05

                            );
                            AuthService.indx=index;
                            print(index);
                            //print("object");

                          }

                         */
      ),
    );
  }
}
