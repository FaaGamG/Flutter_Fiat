import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Showiot extends StatefulWidget {
  const Showiot({super.key});

  @override
  State<Showiot> createState() => _ShowiotState();
}

class _ShowiotState extends State<Showiot> {
final dbfirebase = FirebaseDatabase.instance.ref().child('Flutter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder(
          stream: dbfirebase.onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> map =
                  snapshot.data!.snapshot.value as dynamic ?? {};
              List<dynamic> list = [];
              map.forEach((key, value) {
                list.add({'key': key, ...value}); // เพิ่ม key เข้าไปใน list
              });
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(list[index]['name']),
                      subtitle: Text(list[index]['status']),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          //เมื่อคลิก
                          _showUpdateDialog(context, list[index]);
                        },
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void _showUpdateDialog(BuildContext context, Map<dynamic, dynamic> data) {
    final nameController = TextEditingController(text: data['name']);
    final statusController = TextEditingController(text: data['status']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: statusController,
                decoration: const InputDecoration(labelText: 'Status'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                dbfirebase.child(data['key']).update({
                  'name': nameController.text,
                  'status': statusController.text,
                }).then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  print('Error updating data: $error');
                });
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}