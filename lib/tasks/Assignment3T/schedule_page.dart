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
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.grey[50],
        leading: Container(
          margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[100],
            ),
            padding: EdgeInsets.all(8),
            child: Icon(Icons.notification_add_outlined, color: Colors.black),
          ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: DateSelectorWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Schedule",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: demoPlaces.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: demoPlaces[index],
                    onPress: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "22 October",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 15,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) => dayContainer(index)),
          ),
        ],
      ),
    );
  }

  Widget dayContainer(int index) {
    List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
    List<String> dates = ["18", "19", "20", "21", "22", "23", "24"];

    bool isSelected = index == selectedIndex;

    return Container(
      width: 40,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            days[index],
            style: TextStyle(
                fontSize: 14, color: isSelected ? Colors.white : Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            dates[index],
            style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    required this.product,
    required this.onPress,
  });

  final double width;
  final Place product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  product.image,
                  width: 85,
                  height: 85,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(
                          "26 January 2022",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(
                          product.location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Place {
  final int id;
  final String title, location;
  final String image;

  Place({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
  });
}

List<Place> demoPlaces = [
  Place(
    id: 1,
    image:
        "https://img.freepik.com/premium-vector/picture-house-boat-snowy-landscape_1268481-1048.jpg",
    title: "Niladri Reservoir",
    location: "Tekergat, Sunamgnj",
  ),
  Place(
    id: 2,
    image:
        "https://img.freepik.com/premium-vector/painting-river-running-through-landscape-with-river-running-through-it_1284750-19.jpg",
    title: "Casa Las Tirtugas",
    location: "Av Damero, Mexico",
  ),
  Place(
    id: 3,
    image:
        "https://img.freepik.com/premium-vector/poster-river-with-river-mountains-background_895622-2753.jpg",
    title: "Aonang Villa Resort",
    location: "Bastola, Islampur",
  ),
  Place(
    id: 4,
    image:
        "https://img.freepik.com/premium-vector/painting-river-with-sun-background-cartoon-drawing-artwork-vector_893055-17536.jpg?w=360",
    title: "Rangauti Resort",
    location: "Sylhet, Airport Road",
  ),
  Place(
    id: 5,
    image:
        "https://img.freepik.com/premium-vector/painting-boats-harbor-illustration-cartoon-drawing-artwork-vector_893055-23168.jpg",
    title: "Kachura Resort",
    location: "Vellima, Island",
  ),
  Place(
    id: 6,
    image:
        "https://img.freepik.com/premium-vector/hiking-trail-illustration-cartoon-drawing-artwork-vector_893055-18917.jpg",
    title: "Shakardu Resort",
    location: "Shakartu, Pakistan",
  ),
];
