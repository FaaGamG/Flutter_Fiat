import 'package:finalmobile/constant/constant.dart';
import 'package:finalmobile/firebase_options.dart';
import 'package:finalmobile/screen/addrealtime.dart';
import 'package:finalmobile/screen/async.dart';
import 'package:finalmobile/screen/create.dart';
import 'package:finalmobile/screen/dashboard.dart';
import 'package:finalmobile/screen/dogapi.dart';
import 'package:finalmobile/screen/firebaselogin.dart';
import 'package:finalmobile/screen/home.dart';
import 'package:finalmobile/screen/login.dart';
import 'package:finalmobile/screen/profile.dart';
import 'package:finalmobile/screen/register.dart';
import 'package:finalmobile/screen/registerfirebase.dart';
import 'package:finalmobile/screen/showiot.dart';
import 'package:finalmobile/screen/update.dart';
import 'package:finalmobile/screen/videoyoutube.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //เชื่อมกับ function home ที่ floder screen  =>>file home.dart
      home: Home(),
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
      //สร้างroutes
    routes: {
      'async': (context) => APIAsync(),
      'dogapi': (context) => dogapi(),
      'login' :(context) => Dashboard(),
      'dashboard':(context) => Dashboard(),
      'registor':(context)=> Register(),
      'profile1':(context)=> profile(),
      'createpage':(context)=> create(),
      'update':(context) => UP(),
      'registerfirebase':(context) => Registerfirebase(),
      'videoyoutube':(context)=> Videoyoutube(),
      'firebaselogin':(context)=>Firebaselogin(),
      'addrealtime':(context)=> Addrealtime(),
      'showiot':(context)=> Showiot(),
      //'login' :(context) => login(),
    },
    
    );
  }
}