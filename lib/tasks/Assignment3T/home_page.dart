import 'package:flutter/cupertino.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> pageData = [
    {
      "image":
          "https://img.freepik.com/premium-vector/painting-boats-harbor-illustration-cartoon-drawing-artwork-vector_893055-23168.jpg",
      "title": "Niladri Reservoir",
      "location": "Tekergat, Sunamgnj",
    },
    {
      "image":
          "https://img.freepik.com/premium-vector/hiking-trail-illustration-cartoon-drawing-artwork-vector_893055-18917.jpg",
      "title": "Darmat Reservoir",
      "location": "Darmat, Sunamgnj",
    },
    {
      "image":
          'https://img.freepik.com/premium-vector/painting-river-with-sun-background-cartoon-drawing-artwork-vector_893055-17536.jpg?w=360',
      "title": "Fiji Reservoir",
      "location": "Fiji, Iceland",
    },
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.only(top: 2, bottom: 2, right: 10, left: 2),
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-vector/man-profile-account-picture_24908-81754.jpg"),
                    radius: 20,
                  ),
                  Text(
                    "Leonardo",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xfff2f2f2))),
                onPressed: () {},
                icon: Icon(Icons.notification_add_outlined))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 35),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Explore the ',
                      style: TextStyle(color: Colors.black, fontSize: 45),
                      children: [
                        TextSpan(
                            text: 'Beautiful ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: 'world!',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        )
                      ]),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Best Destination',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500)),
                    Text('View all',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 370,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pageData.length,
                    itemBuilder: (context, index) {
                      final item = pageData[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Card(
                          child: SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: Image(
                                      image: NetworkImage(item['image']!),
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        item['title']!,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                            size: 20,
                                          ),
                                          Text(
                                            '4.7',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: Colors.black26,
                                          ),
                                          Text(
                                            item['location']!,
                                            style: TextStyle(
                                                color: Colors.black26,
                                                fontSize: 11),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          for (int i = 0; i < 4; i++)
                                            Align(
                                              widthFactor: 0.5,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 15,
                                                backgroundImage: NetworkImage(
                                                    "https://img.freepik.com/free-vector/woman-profile-account-picture_24908-81036.jpg"),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white54,
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(Icons.home, "Home"),
              buildNavItem(Icons.calendar_today, "Calendar"),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              buildNavItem(Icons.message_outlined, "Messages"),
              buildNavItem(Icons.person_2_outlined, "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildNavItem(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min, // Prevent stretching
    children: [
      Icon(icon, color: Colors.grey),
      Text(label,
          style: TextStyle(
              fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w300)),
    ],
  );
}
