import 'package:flutter/material.dart';
import 'package:untitled12/account/profile.dart';

class editPage extends StatefulWidget {
  var name = 'Sabbir Ahmed';
  var email = 'sabbir.rzs17@gmail.com';
  var cell = '01521756345';
  static const routeName = "/profile";

  @override
  _editPageState createState() => _editPageState();
}

class _editPageState extends State<editPage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(),
        title: Row(
          children: [
            SizedBox(
              width: 70,
            ),
            Text("User Profile"),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Column(
            children: [
              //for circle avtar image
              _getHeader(),
              SizedBox(
                height: 10,
              ),
              _profileName(editPage().name),
              SizedBox(
                height: 14,
              ),
              _heading("Personal Details"),
              SizedBox(
                height: 6,
              ),
              _detailsCard(),
              SizedBox(
                height: 10,
              ),
              //_heading("Settings"),
              SizedBox(
                height: 6,
              ),
              // Spacer()
              Spacer(),



              saveButton()
            ],
          )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://as1.ftcdn.net/v2/jpg/02/09/95/42/1000_F_209954204_mHCvAQBIXP7C2zRl5Fbs6MEWOEkaX3cA.jpg"))
              // color: Colors.orange[100],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            Card(
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(editPage().email),
              ),
            ),

            Divider(
              height: 0.6,
              color: Colors.black,
            ),

            Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                title: buildTextField(' Contact No:', 'Enter Your Number:', false),
              ),
            ),

            Divider(
              height: 0.6,
              color: Colors.black,
            ),

            Card(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: buildTextField(' Location', 'Enter your location:', false),
                )),

          ],
        ),
      ),
    );
  }


  Widget saveButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      },
      child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          )),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: TextField(
        decoration: InputDecoration(

            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 12,
              color: Colors.black87,
            )),
      ),
    );
  }

}
