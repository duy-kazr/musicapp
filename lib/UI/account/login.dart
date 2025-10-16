import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


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
            const SizedBox(height: 50,),
            Directionality(
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width: 220,
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
                          fit: BoxFit.contain,
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

