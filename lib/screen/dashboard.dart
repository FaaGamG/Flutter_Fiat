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
    'https://www.inet.co.th/static/images/mMTutIRhWimfLgZ.jpg', // Example Image URL 3
  ];

  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
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
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text("Home", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_sharp,
                  color: Colors.blueAccent),
              title: const Text("Profile", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'profile1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_location, color: Colors.blueAccent),
              title: const Text("Create", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'createpage');
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.access_time_sharp, color: Colors.blueAccent),
              title: const Text("Update", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'update');
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_shopping_cart_rounded,
                  color: Colors.blueAccent),
              title: const Text("Shop", style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading:
                  const Icon(Icons.airplay_outlined, color: Colors.blueAccent),
              title: const Text("Video", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'videoyoutube');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_rounded,
                  color: Colors.blueAccent),
              title: const Text("Realtime", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'addrealtime');
              },
            ),
            ListTile(
              leading: const Icon(Icons.aod_outlined, color: Colors.blueAccent),
              title: const Text("Show IoT", style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pushNamed(context, 'showiot');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        // Enables scrolling
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel for changing images
              SizedBox(
                height: 200,
                width: double.infinity,
                child: GestureDetector(
                  onTap: _nextImage, // Change image when tapped
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      _images[_currentIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Welcome Text
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    Text(
                      "Welcome to the Rajamangala University of Technology Isan SURIN Campus.",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Here you can monitor your activities, manage settings, and explore the app features.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              // News Section
              const SizedBox(height: 20),
              const Text(
                "Latest News",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Big Tech Innovations Coming Soon!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Stay tuned for upcoming features and tech innovations that are about to launch in the coming months. Our team is constantly working to enhance your experience.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(Icons.access_time, color: Colors.grey, size: 16),
                        SizedBox(width: 5),
                        Text("Updated 2 days ago"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Card for Statistics Overview
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.insert_chart,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                  title: const Text(
                    "Statistics Overview",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle:
                      const Text("Get a quick glance at your performance."),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blueAccent,
                  ),
                  onTap: () {
                    // Navigate to stats page
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
