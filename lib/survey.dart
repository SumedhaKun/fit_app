import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/home_screen.dart';
import 'profile_screen.dart';

class Survey extends StatefulWidget {
  static int time=0;
  static int focus=0;
  static int reason=0;
  @override
  _SurveyState createState() => _SurveyState();

}

class _SurveyState extends State<Survey> {
  int reasonIndex=0;
  int focusIndex=0;
  int timeIndex=0;
  CupertinoPicker iOSpicker(List<String> list, int question){
    List<Text> options=[];
    for(String t in list){
      options.add(Text(t));
    }
    return CupertinoPicker(
      onSelectedItemChanged: (selectedIndex){
        setState(() {
            if(question==0){
              reasonIndex=selectedIndex;
            }
            else if(question==1){
              focusIndex=selectedIndex;
            }
            else{
              timeIndex=selectedIndex;
            }

        });
      },
      itemExtent: 32.0,
      children: options,
    );

  }
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'IndieFlower',
      ),
      home: Scaffold(
        body: Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Colors.green.shade200,
                  Colors.blue.shade200,
                ],
              ),
            ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Take this short survey to determine a ideal workout for you!",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Reason for workout?",style: TextStyle(fontSize: 22),),
                ),

                iOSpicker(["For fun","Weight Loss","None of the above"],0),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("What part of the body do you want to focus on?",style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
                ),
                iOSpicker(["Lower body","Upper body", "Both"],1),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("When are you free to do your ten minute workout routine daily?",style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
                ),
                iOSpicker(["Morning","Afternoon", "Evening"],2),
              /*
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (context) => OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text('Go home'),
                    ),
                  ),
                ),

               */
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Builder(
                    builder: (context) => OutlineButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                //builder: (context) => HomeScreen(reason: reasonIndex, focus: focusIndex, time: timeIndex,)));
                            builder: (context){
                              Survey.time=timeIndex;
                              Survey.focus=focusIndex;
                              Survey.reason=reasonIndex;

                              return HomeScreen();
                        }));
                        },
                      borderSide: BorderSide(color: Colors.black),
                      child: Text('Go to Home Page',style: TextStyle(fontSize: 22)),
                    ),
                  ),
                ),



              ],
            )
          )
        )
      ),
    );
  }
}

