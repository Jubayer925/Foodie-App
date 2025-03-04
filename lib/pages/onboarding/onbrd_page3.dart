import 'package:flutter/material.dart';


class OnbrdPage3 extends StatelessWidget {
  const OnbrdPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/slide3.png'),
        SizedBox(
          height: 40,
        ),
        Text(
          "Instant World-\nWide Delivery",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Your orders will be delivered instantly\nirrespective of your location around the world",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black45),
        )
      ],
    );
  }
}
