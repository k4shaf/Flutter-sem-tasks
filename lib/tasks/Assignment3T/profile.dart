import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              child: Image.asset('assets/images/avatar.png', height: 150),
            ),
            SizedBox(height: 5),
            Text(
              'Leonardo',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Text('leonardo@gmail.com', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 40),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text('Reward Points',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('360',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text('Travel Trips',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('238',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text('Bucket List',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          Text('473',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_outlined,
                color: Colors.black,
                size: 27,
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                // Handle button tap
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.bookmark_border,
                color: Colors.black,
                size: 27,
              ),
              title: Text(
                "Bookmarked",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                // Handle button tap
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.airplane_ticket_outlined,
                color: Colors.black,
                size: 27,
              ),
              title: Text(
                "Previous Trips",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                // Handle button tap
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 27,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                // Handle button tap
              },
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 27,
              ),
              title: Text(
                "Version",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.black),
              onTap: () {
                // Handle button tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
