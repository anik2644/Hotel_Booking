//import 'dart:js_util';

class Hotel{
 late String name;
 late String description;

  /*
  bool airport;
  bool bar;
  bool benchpoint;
  bool parking;
  bool restaurant;
  bool wifi;
*/
 late String x;
 String location ="Cox's Bazar";
 late String y ;
 late String z;
 bool isFav=false;
 String cellNo= "01521756345";
 late String address;
  //List <String> image;


  //
   Hotel(String location,String address,String name,String description,String x,String y,String z)
  {

    this.location=location;
    this.address=address;
      this.name= name;
      this.description= description;
      this.x =x;
      this.y=y;
      this.z=z;

  //  print("done");
  //  var image;
   /*
    image.add(x);
    image.add(y);
    image.add(z);
    */

  }

 // get image => null;


}