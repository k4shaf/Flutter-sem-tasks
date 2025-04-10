import 'dart:ui';
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
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  final PageController _pageController = PageController();
  final List<Map<String, String>> pageData = [
    {
      "image":
          "https://img.freepik.com/premium-vector/painting-boats-harbor-illustration-cartoon-drawing-artwork-vector_893055-23168.jpg",
      "title": "Life is short and the world is wide",
      "description":
          "At Friends, tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world.",
      "button": "Get Started",
    },
    {
      "image":
          "https://img.freepik.com/premium-vector/hiking-trail-illustration-cartoon-drawing-artwork-vector_893055-18917.jpg",
      "title": "It's a big world out there go explore",
      "description":
          "To get the best of your adventure you just need to leave and go where you like. We are waiting for you!",
      "button": "Next",
    },
    {
      "image":
          'https://img.freepik.com/premium-vector/painting-river-with-sun-background-cartoon-drawing-artwork-vector_893055-17536.jpg?w=360',
      "title": "Life is short and the world is wide",
      "description":
          "To get the best of your adventure you just need to leave and go where you like. We are waiting for you!",
      "button": "Next",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: pageData.length,
              itemBuilder: (context, index) => BoardingContent(
                image: pageData[index]['image'],
                title: pageData[index]['title'],
                description: pageData[index]['description'],
                button: pageData[index]['button'],
              ),
            ),
          ),
          SizedBox(
            height: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageData.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  margin: EdgeInsets.only(right: 5),
                  height: 10,
                  width: currentPage == index ? 20 : 6,
                  decoration: BoxDecoration(
                    color: currentPage == index ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (currentPage < pageData.length - 1) {
                        _pageController.animateToPage(currentPage + 1,
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInOut);
                      } else {}
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15),
                      ),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    ),
                    child: Text(currentPage > 0 ? 'Next' : 'Get Started'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoardingContent extends StatelessWidget {
  const BoardingContent(
      {super.key, this.image, this.title, this.description, this.button});

  final String? image, title, description, button;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Image(
              image: NetworkImage('$image'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text:
                                "${title!.split(' ').sublist(0, title!.split(' ').length - 1).join(' ')} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                            children: [
                              TextSpan(
                                text: title!.split(' ').last,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ])),
                    Positioned(
                        right: 70,
                        bottom: 0,
                        child: CustomPaint(
                          painter: CurvedUnderlinePainter(),
                          size: Size(70, 10),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  description!,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CurvedUnderlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 2, 0, // Control point
        size.width, size.height, // End point
      );

    final pathMetric = path.computeMetrics().first;
    final length = pathMetric.length;

    for (double i = 0; i < length; i += 2) {
      final extractedPath = pathMetric.extractPath(i, i + 2);

      // Normalize tapering: 0 at edges, 1 in the center
      double t = (i / length - 0.5).abs() * 2;
      final strokeWidth =
          lerpDouble(4, 1, t)!; // Thicker in center, thinner at both ends

      paint.strokeWidth = strokeWidth;
      canvas.drawPath(extractedPath, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
