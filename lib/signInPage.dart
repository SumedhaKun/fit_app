import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';
import 'survey.dart';

import 'package:provider/provider.dart';



import 'google_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("Welcome! Ready to get fit?",style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),),
              ),
              //SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/excer.png',alignment: Alignment.center, height: 150,),
              ),
              //Container



              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
                  builder: (context){
                    return Container(
                      color: Color(0xff4687f1),
                      width: 220,
                      height: 50,
                      child: OutlineButton.icon(

                      //visualDensity: VisualDensity.adaptivePlatformDensity,
                        color: Color(0xff4687f1),

                      label: Text('    Sign in with Google', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      icon: FaIcon(FontAwesomeIcons.google,color: Colors.white,),
                      onPressed: (){
                        final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
                        provider.googleLogIn();
                        Navigator.push(context,
                        MaterialPageRoute(
                        builder: (context) => Survey()));
                        },
                        ),
                    );
                    },

                  )


                ),

            ],
          ),
        ),
      ),
    );
  }
}
