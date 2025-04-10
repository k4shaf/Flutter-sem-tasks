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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DetailsPage(),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.withOpacity(0.5),
          ),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.bookmark_border, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/hand-drawn-nature-scene-illustration_52683-106246.jpg"),
              fit: BoxFit.contain,
              alignment: Alignment.topCenter),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(400, 70),
                topRight: Radius.elliptical(400, 70),
              ),
              color: Colors.white,
            ),
            height: 440,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Niladri Reservoir",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "Tekergat, Sunamgnj",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage(
                          "https://img.freepik.com/free-vector/man-profile-account-picture_24908-81754.jpg",
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                            size: 18,
                          ),
                          Text(
                            "Tekergat",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent[100],
                            size: 22,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "4.7 ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: "(2498)",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: "\$59/",
                          style: TextStyle(color: Colors.blue),
                          children: [
                            TextSpan(
                              text: "Person",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ImageRowWidget(),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Destination",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation ETC...",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        TextSpan(
                          text: "Read More",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(Colors.blue),
                      ),
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Allows scrolling if needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imageItem(
              "https://img.freepik.com/premium-vector/picture-house-boat-snowy-landscape_1268481-1048.jpg"),
          imageItem(
              "https://img.freepik.com/premium-vector/painting-river-running-through-landscape-with-river-running-through-it_1284750-19.jpg"),
          imageItem(
              "https://img.freepik.com/premium-vector/painting-river-with-sun-background-cartoon-drawing-artwork-vector_893055-17536.jpg?w=360"),
          imageItem(
              "https://img.freepik.com/premium-vector/painting-boats-harbor-illustration-cartoon-drawing-artwork-vector_893055-23168.jpg"),
          imageItem(
              "https://img.freepik.com/premium-vector/picture-house-boat-snowy-landscape_1268481-1048.jpg"),
        ],
      ),
    );
  }

  Widget imageItem(String url) {
    return Padding(
      padding: EdgeInsets.all(10), // Adds spacing between images
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        child: Image.network(
          url,
          width: 45,
          height: 45,
          fit: BoxFit.cover, // Ensures images are cropped properly
        ),
      ),
    );
  }
}
