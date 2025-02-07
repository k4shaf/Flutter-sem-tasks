import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APP BAR
      appBar: AppBar(
        leading: Image.asset("assets/images/bloodLogo.png"),
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),

      // STACK
      body: Column(
        children: [
          Stack(
            children: [
              // Background with extended AppBar
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              // Positioned Card
              Positioned(
                top: 10, // Adjust position to overlap with the app bar
                left: 16,
                right: 16,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items Price",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.grey[700]),
                              ),
                              DropdownMenu(
                                inputDecorationTheme: InputDecorationTheme(),
                                dropdownMenuEntries: [],
                                label: Text("Today"),
                                width: 130,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Items with prices
                            ItemWidget(
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHWLa9PoJJ-AluPwNSu23NMVBFMLlTvc3qw&s",
                                price: "775,000"),
                            ItemWidget(
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHWLa9PoJJ-AluPwNSu23NMVBFMLlTvc3qw&s",
                                price: "775,000"),
                            ItemWidget(
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp_jqc5A9IQYEx5Kh4FAhh7Lh4xmUa3uhiuw&s",
                                price: "2,000"),
                            ItemWidget(
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbUa_73rwRjGKQtqvj1wwpdK_vCOAljgsCg&s",
                                price: "20,000"),
                          ],
                        ),
                        // SizedBox(height: 3),
                        // Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            customTextIcon("Like", Icons.thumb_up),
                            customTextIcon("Comment", Icons.comment),
                            customTextIcon("Share", Icons.share),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 230,
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Products",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[700]),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ItemWidgetTwo(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHWLa9PoJJ-AluPwNSu23NMVBFMLlTvc3qw&s",
                    price: "775,000",
                    name: "Car",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp_jqc5A9IQYEx5Kh4FAhh7Lh4xmUa3uhiuw&s",
                    price: "2,000",
                    name: "Bottle",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnbUa_73rwRjGKQtqvj1wwpdK_vCOAljgsCg&s",
                    price: "20,000",
                    name: "Laptop",
                  ),
                  ItemWidgetTwo(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHWLa9PoJJ-AluPwNSu23NMVBFMLlTvc3qw&s",
                    price: "775,000",
                    name: "Car",
                  ),
                ],
              ),
              // SizedBox(height: 3),
              PostWidget(
                name: 'Kashaf Naqvi',
                timeAgo: 'Just Now',
                postText: 'Bought a new car!',
                postImageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGHWLa9PoJJ-AluPwNSu23NMVBFMLlTvc3qw&s',
              ),
            ],
          ),
        ],
      ),

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        shape: CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BOTTOM BAR
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        shape: CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: 'Open navigation menu',
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.accessibility),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTextIcon(String text, IconData icon) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: Colors.grey[600],
      ),
      label: Text(
        text,
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final String imageUrl; // URL of the image
  final String price;

  const ItemWidget({super.key, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container for the network image
        Container(
          width: 50, // Define the size of the square
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Optional: Rounded corners
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Load image from network
              fit: BoxFit.cover, // Ensure the image fits within the square
            ),
          ),
        ),
        // const SizedBox(height: 4),
        // Price text
        Text(
          price,
          style: const TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class ItemWidgetTwo extends StatelessWidget {
  final String imageUrl; // URL of the image
  final String price;
  final String name;

  const ItemWidgetTwo(
      {super.key,
      required this.imageUrl,
      required this.price,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Square container for the network image
        Container(
          width: 50, // Define the size of the square
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // Optional: Rounded corners
            image: DecorationImage(
              image: NetworkImage(imageUrl), // Load image from network
              fit: BoxFit.cover, // Ensure the image fits within the square
            ),
          ),
        ),
        // const SizedBox(height: 4),
        // Price text
        Text(
          name,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w900,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  final String name;
  final String timeAgo;
  final String postText;
  final String postImageUrl;

  const PostWidget({
    super.key,
    required this.name,
    required this.timeAgo,
    required this.postText,
    required this.postImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 24,
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                // User Name and Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Options Menu
                Icon(Icons.more_vert),
              ],
            ),
            // const SizedBox(height: 10),
            // Post Text
            Padding(
              padding: const EdgeInsets.only(left: 55.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postText,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  // Post Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      postImageUrl,
                      height: 120, // Adjust height as needed
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
