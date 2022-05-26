import 'package:flutter/material.dart';
import 'package:fit_app/home_screen.dart';
import 'package:fit_app/main.dart';
import 'package:fit_app/signInPage.dart';
import 'package:fit_app/survey.dart';
import 'survey.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'google_sign_in.dart';
import 'package:provider/provider.dart';



class ProfileScreen extends StatefulWidget {
  ProfileScreen({this.time});
  final int time;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  final user=FirebaseAuth.instance.currentUser;
  //_ProfileScreenState({this.time});
  //final int time;
  int time=Survey.time;
  @override
  Widget build(BuildContext context) {

      Text w;
      if(time==0){
        w=Text("morning",style: TextStyle(color: Colors.white,fontSize: 20));
      }
      else if(time==1){
        w=Text("afternoon",style: TextStyle(color: Colors.white,fontSize: 20));
      }
      else{
        w=Text("evening",style: TextStyle(color: Colors.white,fontSize: 20));
      }

      return MaterialApp(
        theme: ThemeData(
          fontFamily: 'IndieFlower',
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Colors.cyan.shade800,
                    Colors.lightBlue.shade900,
                  ],
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Circle(user: user),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Username: " + user.displayName, style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(mainAxisAlignment:MainAxisAlignment.center,children: [Text("Workout Time: ",style: TextStyle(color: Colors.white,fontSize: 20),),w],),
                  ),



                  Builder(
                    builder: (context) => OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      borderSide: BorderSide(color: Colors.black),
                      child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),
                  Builder(
                    builder: (context) => OutlineButton(
                      onPressed: () {
                        final provider= Provider.of<GoogleSignInProvider>(context,listen:false);
                        provider.logout();
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      borderSide: BorderSide(color: Colors.black),
                      child: Text('Log Out',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
}

class Circle extends StatelessWidget {
  const Circle({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(user.photoURL),
      backgroundColor: Colors.black,
      radius: 80.0,
    );
  }
}
