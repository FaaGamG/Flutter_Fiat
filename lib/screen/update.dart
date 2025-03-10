import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UP extends StatefulWidget {
  const UP({super.key});

  @override
  State<UP> createState() => _UPState();
}

class _UPState extends State<UP> {

  final TextEditingController _email = TextEditingController(text: 'Note');
  final TextEditingController _password = TextEditingController(text: 'Hm');
  final String user_id = "2";
  //ประกาศตัวแปร
  final _formKey = GlobalKey<FormState>();
  // final _email = TextEditingController();
  // final _password = TextEditingController();
  bool _isLoading =
      false; // ถ้ากดแล้วเปลี่ยนสถานะให้เป็น ture เพื่อป้องกันไม่ให้ กด ซ้ำๆหลายๆรอบ

  Future<void> submintForm() async {
    print('Hello word');
    //ประกาศตัวแปร เพื่อรับค่าตัวแปรจาก input
    final String email = _email.text;
    final String passoword = _password.text;

    //กำหนดเส้นทาง api
    final url = Uri.parse('https://reqres.in/api/users/${user_id}');

    //การส่ง api แบบ post
    final response = await http.put(
      url,
      //กำหนดรูปแบบการส่ง แบบ json
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': email, 'job': passoword}),
    );
    print(response.statusCode);
    print(response.body);

    //ถ้าส่งapi สำเร็จ
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully: ${data['job']}'),
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
        title: Text('UP'),
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
                // obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: submintForm,
                child: Text('UP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
