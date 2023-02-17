import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ombrelive/google_sign_in.dart';
import 'package:ombrelive/page/home_page.dart';
import 'package:ombrelive/page/login_widget.dart';
import 'package:ombrelive/page/sign_up_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
        home: HomePage(),
      ),
    );
  }
}
