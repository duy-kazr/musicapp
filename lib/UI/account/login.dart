import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Sign in google and get access token to read and write on drive
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/drive.file',
  ],
);

Future<String?> signInAndGetAccessToken() async {
  final account = await _googleSignIn.signIn();
  final auth = await account?.authentication;
  return auth?.accessToken;
}


//Build UI for Sign in screen
class LoginWidget extends StatefulWidget{
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              width: 180,
              height: 180,
              child: Image.asset("assets/images/logo_image.png", fit: BoxFit.contain,),
            ),
            const Text("Melodious",
              textDirection: TextDirection.ltr,
              style: TextStyle( fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 12,),
            Directionality(
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Sign in with",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 5,),
                        Image.asset("assets/icons/google_icon.png",
                          width: 40,
                          height: 40,
                        ),
                      ],
                    )
                ),
              ),
            )
          ]
    );
  }

}

