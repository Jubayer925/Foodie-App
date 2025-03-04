import 'package:flutter/material.dart';

class OnbrdPage1 extends StatelessWidget {
  const OnbrdPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/slide1.png'),
        SizedBox(
          height: 40,
        ),
        Text(
          "World-Class Chefs",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Our dishes are prepared by only the best",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black45),
        )
      ],
    );
  }
}
