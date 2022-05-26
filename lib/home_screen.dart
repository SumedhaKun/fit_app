import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/profile_screen.dart';
import 'package:fit_app/signInPage.dart';
import 'package:fit_app/survey.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final user = FirebaseAuth.instance.currentUser;
  int focus = Survey.focus;
  int reason = Survey.reason;

  @override
  Widget build(BuildContext context) {
    Text t;
    Text q;
    if (focus == 0) {
      t = Text(
        "Lower Body Workout: \n 1. Lunges (15x) \n 2. Squats (10x) \n 3. Jumping jacks (20x)",
        style: TextStyle(fontSize: 25.0, color: Colors.white),
      );
    } else if (focus == 1) {
      t = Text(
          "Upper Body Workout:\n 1. Pushups (10x) \n 2. Plank (30 secs) \n 3. Curl ups (10x)",
          style: TextStyle(fontSize: 25.0, color: Colors.white));
    } else {
      t = Text(
          "Full Body Workout:\n 1. Lunges (15x) \n 2. Squats (10x) \n 3. Jumping jacks (20x) \n 4. Pushups (10x) \n 5. Plank (30 secs) \n 6. Curl ups (10x)",
          style: TextStyle(fontSize: 25.0, color: Colors.white));
    }
    if (reason == 0) {
      q = Text(
        "Let's have some fun!!!",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
            fontFamily: 'IndieFlower'),
      );
    } else if (reason == 1) {
      q = Text(
        "Let's lose some weight!",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
            fontFamily: 'IndieFlower'),
      );
    } else {
      q = Text(
        "Let's work out today!",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
            fontFamily: 'IndieFlower'),
      );
    }

    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'IndieFlower',
      ),
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              title: Text(
                "Workouts Page",
                style: TextStyle(fontSize: 30.0,fontFamily: 'IndieFlower'),
              ),
              actions: [button()],
              backgroundColor: Colors.black,
            )),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: BottomAppBar(
              elevation: 0,
              color: Colors.black,
              child: MaterialButton(
                child: Text(
                  "Edit Survey",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Survey()));
                },
              )),
        ),
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print("logged in");
            } else {
              return SignInPage();
            }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.8, 1),
                  colors: <Color>[
                    Color(0xff1f005c),
                    Color(0xff5b0060),
                    Color(0xff870160),
                    Color(0xffac255e),
                    Color(0xffca485c),
                    Color(0xffe16b5c),
                    Color(0xfff39060),
                    Color(0xffffb56b),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeTitle(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: t,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: q,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30.0,
      backgroundImage: NetworkImage(user.photoURL),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  HomeTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "Welcome " + user.displayName + "!",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 33),
        textAlign: TextAlign.center,
      ),
    );
  }
}
