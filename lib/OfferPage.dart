import 'package:flutter/material.dart';

class OfferPage extends StatefulWidget {

  @override
  _OfferPageState createState()  => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                //container to clickable inkwell

                InkWell(
                  onTap: (){

                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('SHELTA50'),
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
                        image: AssetImage("assets/a.png"),
                        height: 200.0,
                        width: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
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
              ],
            ),
          ),
          Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
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
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
              child: Image(
                image: AssetImage("assets/early.jpg"),
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
                image: AssetImage("assets/book.jpg"),
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
// ListTile(
// title: Text('Theme'),
// onTap: () {
// },
// )