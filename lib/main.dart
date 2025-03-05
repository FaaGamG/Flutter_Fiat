import 'package:finalmobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'screen/addrealtime.dart';
import 'screen/async.dart';
import 'screen/create.dart';
import 'screen/dashboard.dart';
import 'screen/dogapi.dart';
import 'screen/firebaselogin.dart';
import 'screen/profile.dart';
import 'screen/register.dart';
import 'screen/registerfirebase.dart';
import 'screen/showiot.dart';
import 'screen/start.dart';
import 'screen/update.dart';
import 'screen/videoyoutube.dart';

Future<void> main() async {
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
      home: start(),
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
      //สร้างroutes
      routes: {
        'async': (context) => APIAsync(),
        'dogapi': (context) => dogapi(),
        'login': (context) => Dashboard(),
        'dashboard': (context) => Dashboard(),
        'registor': (context) => Register(),
        'profile1': (context) => profile(),
        'createpage': (context) => create(),
        'update': (context) => UP(),
        'registerfirebase': (context) => Registerfirebase(),
        'videoyoutube': (context) => Videoyoutube(),
        'firebaselogin': (context) => Firebaselogin(),
        'addrealtime': (context) => Addrealtime(),
        'showiot': (context) => Showiot(),
        'home': (context) => Dashboard(),
        //'login' :(context) => login(),
      },
    );
  }
}
