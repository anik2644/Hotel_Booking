import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class Nafisa extends StatelessWidget {
  Container MyArticles (String imageVal,String hotelname,String hotellocation){
    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children:<Widget> [
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title:'Flutter Demo',
      theme: ThemeData(
        primaryColor: new Color(0xff622F74),
      ),
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("Scroll View -Horizontal",
           style: TextStyle(
            color: Colors.white,
           )
    )
   ),
        */

        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              MyArticles("https://media.istockphoto.com/photos/luxury-resort-picture-id104731717?k=20&m=104731717&s=612x612&w=0&h=40INtJRzhmU1O4Rj24zdY8vj4aGsWpPaEfojaVQ8xBo=","Hotel Grand Mahal","Srinagar,India"),
              MyArticles("https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/07/1hotelsouthbeach.png","Skylight Homez","Singapore"),
              MyArticles("https://img1.10bestmedia.com/Images/Photos/379999/Main-Pool-1_54_990x660.jpg","The Royal Mount","Dubai"),
              MyArticles("https://imageio.forbes.com/specials-images/imageserve/5ec567daf2098c0006c6036e/Kimpton-Shanghai-Hotel/960x0.jpg?format=jpg&width=960","Hotel Niharika","Bangladesh"),
              MyArticles("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTjGpks3M8iiSaW-NvwJll2LTZQEkyfAj8OUV5_Jjs32LlQHCC2HbBfGBntZgMcfRRzDc&usqp=CAU","Hotel Radisson","Bangladesh"),
            ],

          ),
        ),
      ),
    );
  }
}