import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  //ประกาศตัวแปร
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading =
      false; // ถ้ากดแล้วเปลี่ยนสถานะให้เป็น ture เพื่อป้องกันไม่ให้ กด ซ้ำๆหลายๆรอบ

  Future<void> submintForm() async {
    print('Hello word');
    //ประกาศตัวแปร เพื่อรับค่าตัวแปรจาก input
    final String email = _email.text;
    final String passoword = _password.text;

    //กำหนดเส้นทาง api
    final url = Uri.parse('https://reqres.in/api/users/2');

    //การส่ง api แบบ post
    final response = await http.post(
      url,
      //กำหนดรูปแบบการส่ง แบบ json
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': passoword}),
    );
    print(response.statusCode);
    print(response.body);

    //ถ้าส่งapi สำเร็จ
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully: ${data['id']}'),
        ),
      );
      //Navigator.pushNamed(context, 'dashboard');
    }
    
    else{
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('create'),
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
                controller: _email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(labelText: 'Job'),

                //ปกปิดpassword ที่กรอก
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: submintForm,
                child: Text('create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
