import 'package:finalmobile/constant/constant.dart';
import 'package:flutter/material.dart';

class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 125, 234),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 17, 186),
        centerTitle: true,
        title: Text(
          "Teerakarn - Jirapat",
          style: TextStyle(
            fontSize: pFont,
            color: Colors.white,
            
          ),
        ),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            startproject(),
          ],
        ),
      ),
    );
  }
  Widget startproject() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      elevation: 20, // ระดับความเข้มของเงา
      shadowColor: const Color.fromARGB(255, 75, 73, 73), // สีของเงา
    ),
      onPressed: () {
        Navigator.pushNamed(context, 'home');
      },
      child: Text(
        "Start_Project",
        style: TextStyle(
          fontSize: ApiFont,
          color: Colors.black,          
        ),
      ),
    );
  }
}
