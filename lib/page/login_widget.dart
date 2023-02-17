
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ombrelive/page/broadcast_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../google_sign_in.dart';

class LoggedInWidget extends StatefulWidget {

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final _channelName=  TextEditingController();
  final check = '';

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(
        title: Text('Logged In'),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: (){
                final provider  = Provider.of<GoogleSignInProvider>(context,listen: false );

                provider.googleLogout();


              },
              child: Text('Logout'),
          ),

        ],
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.2,
              child: TextFormField(
                controller: _channelName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: 'Channel Name',
                ),
              ),
            ),
            TextButton(
              onPressed: () => onJoin(isBroadcaster: false),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Just Watch  ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.remove_red_eye,
                  )
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.pink,
              ),
              onPressed: () => onJoin(isBroadcaster: true),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Broadcast    ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.live_tv)
                ],
              ),
            ),
            Text(
              check,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      )
    );
  }

  Future<void> onJoin({required bool isBroadcaster}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(),
      ),
    );
  }
}