import 'package:finalmobile/constant/constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 99, 236),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Teerakarn - Jirapat",
          style: TextStyle(
            //เรียกผ่านตัวแปร file constant.dart
            fontSize: pFont,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // btnApi(),
            // SizedBox(height: 20,),
            // btnCamera(),
            SizedBox(height: 20,),
            btndog(),
            SizedBox(height: 20,),
            btnlogin(),
            SizedBox(height: 20),
            btnregistor(),
            SizedBox(height: 20),
            registerfirebase(),
            SizedBox(height: 20),
            Firebaselogin(),
          ],
        ),
      ),
    );
  }

  Widget btnApi() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'async');
      },
      child: Text(
        "Call API Async",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }

  Widget btnlogin() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'login');
      },
      child: Text(
        "login",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }
  Widget btnregistor() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'registor');
      },
      child: Text(
        "registor",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }

  Widget btnCamera() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "Call Camera",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }
  Widget btndog() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'dogapi');
      },
      child: Text(
        "Dogapi",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }
  Widget registerfirebase() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'registerfirebase');
      },
      child: Text(
        "registerfirebase",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }
  Widget Firebaselogin() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, 'firebaselogin');
      },
      child: Text(
        "firebaselogin",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }
}
