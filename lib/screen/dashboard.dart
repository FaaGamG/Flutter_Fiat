import 'dart:async';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN1E8b5tY_3ej5HoA2OF2ju9P6Lr2KT9UYrA&s', // Example Image URL 1
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIv19VqfxZllm1DJUsCtfw10OszT6CcwIbpg&s', // Example Image URL 2
    'https://www.surin.rmuti.ac.th/th/th63/slider/A89.jpg', // Example Image URL 3
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set up a timer to change the image every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ข้อมูล IoT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, 'profile1');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Text(
                'เมนู',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text("หน้าหลัก", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_sharp,
                  color: Colors.blueAccent),
              title: const Text("โปรไฟล์", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'profile1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_location, color: Colors.blueAccent),
              title: const Text("สร้าง", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'createpage');
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.access_time_sharp, color: Colors.blueAccent),
              title: const Text("อัปเดต", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'update');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart_rounded,
                  color: Colors.blueAccent),
              title: const Text("ร้านค้า", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading:
                  const Icon(Icons.airplay_outlined, color: Colors.blueAccent),
              title: const Text("วิดีโอ", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'videoyoutube');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_rounded,
                  color: Colors.blueAccent),
              title:
                  const Text("ข้อมูลเรียลไทม์", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'addrealtime');
              },
            ),
            ListTile(
              leading: const Icon(Icons.aod_outlined, color: Colors.blueAccent),
              title: const Text("แสดง IoT", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'showiot');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and introductory text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'มาเรียนรู้เกี่ยวกับ IoT กันเถอะ!',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'IoT (Internet of Things) คือ การเชื่อมต่อของอุปกรณ์ต่างๆ ผ่านอินเทอร์เน็ต',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Image carousel that changes every 3 seconds
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    _images[_currentIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Information about IoT
              const Text(
                'เทคโนโลยีที่เกี่ยวข้องกับ IoT:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.blue[50],
                child: ListTile(
                  title: const Text(
                    'เซ็นเซอร์และแอคทูเอเตอร์ (Sensors & Actuators)',
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: const Text(
                    'เซ็นเซอร์ใช้ในการตรวจจับข้อมูลจากโลกภายนอก เช่น อุณหภูมิ, ความชื้น, หรือการเคลื่อนไหว และแอคทูเอเตอร์ใช้ในการตอบสนองการกระทำที่เกิดขึ้น',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.blue[50],
                child: ListTile(
                  title: const Text(
                    'การเชื่อมต่อและเครือข่าย (Connectivity & Networks)',
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: const Text(
                    'การเชื่อมต่อใน IoT จะใช้เทคโนโลยีต่างๆ เช่น Wi-Fi, Bluetooth, LoRa, Zigbee เพื่อให้สามารถแลกเปลี่ยนข้อมูลระหว่างอุปกรณ์ต่างๆ ได้',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
