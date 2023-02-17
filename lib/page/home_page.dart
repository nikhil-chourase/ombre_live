import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ombrelive/page/login_widget.dart';

import 'sign_up_widget.dart';


class HomePage extends StatelessWidget {

  static String id = 'HomePage';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            return LoggedInWidget();
          }
          else if(snapshot.hasError){
            return Center(child: Text('Something went Wrong!'),);
          }

          else{
            return SignUpWidget();
          }

        },

      ),
    );
  }
}