import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  Container MyArticles(String imageVal, String hotelname,
      String hotellocation) {
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image.network(imageVal),
            ListTile(
              title: Text(hotelname),
              subtitle: Text(hotellocation),

            ),
          ],
        ),

      ),
    );
  }

  get drawer => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.blue[300],
          //appBar: ,
          body: CustomScrollView(
            slivers: [


              SliverAppBar(

                automaticallyImplyLeading: true,
                backgroundColor: Colors.black,
                //floating: true,
                // pinned: true,
                // snap: false,
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
                    child: const Center(
                      child: TextField(
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


              SliverList(delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 900 ,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      MyArticles(
                          "https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=",
                          "Hotel Grand Mahal", "Srinagar,India"),
                      MyArticles(
                          "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png",
                          "Skylight Homez", "Singapore"),
                      MyArticles(
                          "https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg",
                          "The Royal Mount", "Dubai"),
                      MyArticles(
                          "https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960",
                          "Hotel Niharika", "Bangladesh"),
                      MyArticles(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTjGpks3M8iiSaW-NvwJll2LTZQEkyfAj8OUV5_Jjs32LlQHCC2HbBfGBntZgMcfRRzDc&usqp=CAU",
                          "Hotel Radisson", "Bangladesh"),
                    ],
                  ),),


              ],
              ),),
            ],),

/*
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text("Hotel Booking")),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              )
            ],
          ),
*/

          drawer: Drawer(
            backgroundColor: Colors.black,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.white),
                  accountName: Text(
                    "MHD Mahmud Anik",
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text("anik11556@gmail.com",
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(
                      "M",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                          backgroundColor: Colors.grey),
                    ),
                  ),
                ),
/*
                ListTile(

                  leading: Icon(Icons.home,color: Colors.white,),
                  title: Text("Home",style: TextStyle(color: Colors.white),),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                */

                ListTile(
                  leading: Icon(Icons.settings, color: Colors.white),
                  title:
                  Text("Settings", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Share",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts, color: Colors.white),
                  title:
                  Text("Contact Us", style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.flag_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Terms & Condition",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            // currentIndex: 2,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_sharp),
                label: 'Offers',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

