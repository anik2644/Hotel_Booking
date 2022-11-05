import 'package:flutter/material.dart';
import 'package:untitled12/account/profile.dart';


class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.black,
        title: Text("Sign In",
          style: TextStyle(
            color: Colors.white
          ),),
      ),


      body: Center(
          //: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          Container(
          margin: EdgeInsets.all(10.0),
          child: new ClipRRect(
            borderRadius: new BorderRadius.circular(17.0),
            child: new Image(
              image: new AssetImage("assets/shelta.png"),
              height: 300.0,
              width: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),


              const SizedBox(
                height: 10,
              ),
              // Container(
              //   child: Image.asset('assets/images/shelta.png', height: 30.0,),
              // ),
              Container(
                margin: EdgeInsets.all(20),
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  Profile()),
                    );
                  },
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 30,
                        child: Image.asset('assets/images/google.png'),
                      ),
                      Text(
                        'Sign In with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
