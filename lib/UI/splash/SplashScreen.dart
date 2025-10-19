import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:musicapp/UI/homepage/mainScreen.dart';
import 'package:musicapp/UI/account/login.dart';
import '../homepage/miniPlayer.dart';



class Splashscreen extends StatefulWidget{
  @override
  State<Splashscreen> createState() => SplashScreenState();
}


class SplashScreenState extends State<Splashscreen>{

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MusicPlayerModel(),
        child: HomeScreenWidget());
  }
}