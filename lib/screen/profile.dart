import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Map<String, dynamic>? userData;
  bool _isLoading = false;

  //function ดึงข้อมูลก่อนทำงาน project
  Future<void> getUerAPI() async {
    print('get user');

    final url = Uri.parse('https://reqres.in/api/users/2');

    final response = await http.get(url);

    final responseData = jsonDecode(response.body);
    setState(() {
      userData = responseData['data'];
    });
  }

  Future<void> Delete() async {
    final url = Uri.parse('https://reqres.in/api/users/2');

    final response = await http.delete(url);
    if (response.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Deleted successfully")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Noo")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    print('Hello world');
    getUerAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: userData == null
          ? const Center(
              child: Text('No Data'),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(userData!['avatar']),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '${userData!['first_name']}${userData!['last_name']}',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      userData!['email'],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Delete();
                      },
                      child: const Text('Delete Account'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
