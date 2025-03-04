import 'package:finalmobile/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class APIAsync extends StatefulWidget {
  const APIAsync({super.key});

  @override
  State<APIAsync> createState() => _APIAsyncState();
}

class _APIAsyncState extends State<APIAsync> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: APIColor,
        centerTitle: true,
        title: Text(
          "Call API",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            widgetCallapi(),
          ],
        ),
      ),
    );
  }

  //call api
  Widget widgetCallapi() {
    return ElevatedButton(
      //วงเว็บแรกคือคำสั่ง
      onPressed: () {
        fxCallApi();
      },
      child: Text(
        "Call api",
        style: TextStyle(
          fontSize: ApiFont,
        ),
      ),
    );
  }

  fxCallApi() {
    print("hello");

    
    //ประกาศ ตัวแปร url ให้มีค่า เท่ากับ api ของ google
    var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});


    //.
    http.get(url).then((response){
      print("สำเร็จ");
      print(response.statusCode);
      print('Response body: ${response.body}');
    });
  }
}
