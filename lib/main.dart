import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:musicapp/UI/homepage/homePage.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MusicApp());
}

class MusicApp extends StatefulWidget{
  const MusicApp({super.key});

  @override
  State<MusicApp> createState() => MusicAppSplashState();
}

class MusicAppSplashState extends State<MusicApp>{

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
    return const HomepageWidget();
  }
}