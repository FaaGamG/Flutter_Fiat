import 'package:finalmobile/constant/constant.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
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
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,

                ),
              ),
            ),
            //สร้างเมนู
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, 'profile1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_location),
              title: const Text("create"),
              onTap: () {
                Navigator.pushNamed(context, 'createpage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.access_time_sharp),
              title: const Text("Update"),
              onTap: () {
                Navigator.pushNamed(context, 'update');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart_rounded),
              title: const Text("Shop"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.airplay_outlined),
              title: const Text("Video"),
              onTap: () {
                Navigator.pushNamed(context, 'videoyoutube');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_rounded),
              title: const Text("realtime"),
              onTap: () {
                Navigator.pushNamed(context, 'addrealtime');
              },
            ),
            ListTile(
              leading: const Icon(Icons.aod_outlined),
              title: const Text("showIOT"),
              onTap: () {
                //route
                Navigator.pushNamed(context, 'showiot');
              },
            ),
          ],
        ),
      ),
    );
  }
}
