import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'signInPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'google_sign_in.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>GoogleSignInProvider(),

      child: MaterialApp(
        home: SignInPage(),
      ),
    );
  }
}
