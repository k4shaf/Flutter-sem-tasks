import 'package:flutter/material.dart';

class Week3 extends StatelessWidget {
  const Week3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              color: const Color(0xff376d23),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                width: 5,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'This is some center aligned text bro :D',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}