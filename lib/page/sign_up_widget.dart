import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../google_sign_in.dart';

class SignUpWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          FlutterLogo(size: 120,),
          Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
              onPressed: (){
                final provider  = Provider.of<GoogleSignInProvider>(context,listen: false );

                provider.googleLogin();
              },
              label: Text(
                'Sign up with Google',

              ), icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
          ),
          SizedBox(height: 40,),
          RichText(
              text: TextSpan(
                text: 'Already Have an Account ? ',
                children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle()
                  ),
                ]
              ),
          ),



        ],
      ),
    );
  }
}
