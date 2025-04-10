import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      home: FavoritesScreen(),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite places",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
          ),
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                "Favourite places",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: demoPlaces.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 16,
                  ),
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
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 130,
                width: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF979797).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: NetworkImage(product.image),fit: BoxFit.cover)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFF979797).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.string(
                        heartIcon,
                        colorFilter: ColorFilter.mode(
                            const Color(0xFFFF4848), BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
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
    image: "https://img.freepik.com/premium-vector/picture-house-boat-snowy-landscape_1268481-1048.jpg",
    title: "Niladri Reservoir",
    location: "Tekergat, Sunamgnj",
  ),
  Place(
    id: 2,
    image: "https://img.freepik.com/premium-vector/painting-river-running-through-landscape-with-river-running-through-it_1284750-19.jpg",
    title: "Casa Las Tirtugas",
    location: "Av Damero, Mexico",
  ),
  Place(
    id: 3,
    image: "https://img.freepik.com/premium-vector/poster-river-with-river-mountains-background_895622-2753.jpg",
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

const heartIcon =
    '''<svg width="18" height="16" viewBox="0 0 18 16" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M16.5266 8.61383L9.27142 15.8877C9.12207 16.0374 8.87889 16.0374 8.72858 15.8877L1.47343 8.61383C0.523696 7.66069 0 6.39366 0 5.04505C0 3.69644 0.523696 2.42942 1.47343 1.47627C2.45572 0.492411 3.74438 0 5.03399 0C6.3236 0 7.61225 0.492411 8.59454 1.47627C8.81857 1.70088 9.18143 1.70088 9.40641 1.47627C11.3691 -0.491451 14.5629 -0.491451 16.5266 1.47627C17.4763 2.42846 18 3.69548 18 5.04505C18 6.39366 17.4763 7.66165 16.5266 8.61383Z" fill="#DBDEE4"/>
</svg>
''';
