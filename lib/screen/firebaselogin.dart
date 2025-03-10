import 'package:finalmobile/screen/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebaselogin extends StatefulWidget {
  const Firebaselogin({super.key});

  @override
  State<Firebaselogin> createState() => _FirebaseloginState();
}

class _FirebaseloginState extends State<Firebaselogin> {
final _email = TextEditingController();
  final _password = TextEditingController();

  Future<void> login() async {
    try {
      await FirebaseAuth.instance
            //อ่านค่าจาก _email ที่สร้างไว้ด้านบน (.text)
          .signInWithEmailAndPassword(email: _email.text, password: _password.text)
          .then((value) {

        // การสั่งให้เปลี่ยนไปหน้าใหม่
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => Dashboard());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print(onError);
      });
    } catch (e) {
      print(e);
    }
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}