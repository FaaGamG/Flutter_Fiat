import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Addrealtime extends StatefulWidget {
  const Addrealtime({super.key});

  @override
  State<Addrealtime> createState() => _AddrealtimeState();
}

class _AddrealtimeState extends State<Addrealtime> {

  // ประกาศตัวแปร
  final name = TextEditingController();
  final status = TextEditingController();

  //store คือkeyหลัก path
  final dbfirebase = FirebaseDatabase.instance.ref().child('Flutter');

  Future<void> createData() async {
    //ส่งไปfirebase
    dbfirebase
        //อยากให้เอาpathออก ลบ .push()
        .push()
        .set({
          //keyกับ value
          'name': name.text,
          'status': status.text,
        })
        .then((value) => print('Success'))
        .catchError((onError) {
          print(onError);
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Firebase'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(labelText: 'name'),
            ),
            TextFormField(
              controller: status,
              decoration: const InputDecoration(labelText: 'Status'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: createData,
              child: const Text('Create Data'),
            ),
          ],
        ),
      ),
    );
  }
}