import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registerfirebase extends StatefulWidget {
  const Registerfirebase({super.key});

  @override
  State<Registerfirebase> createState() => _RegisterfirebaseState();
}

class _RegisterfirebaseState extends State<Registerfirebase> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

//เพิ่มข้อมูลง firebase
  Future<void> submit() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((res) {
      print(res);
    }).catchError((onError) {
      print(onError.code);
      print(onError.messgae);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        //กรอกข้อมูล อยู่ภายใต้ widject Form เสมอ แล้วต้องเอาตัวแปร มาใส่ที่ เพื่อส่งข้อมูลไปได้
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //เอาตัวแปรมาใส่
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(labelText: 'Password'),

                //ปกปิดpassword ที่กรอก
                obscureText: true,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
