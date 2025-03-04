import 'package:flutter/material.dart';


class OnbrdPage2 extends StatelessWidget {
  const OnbrdPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/slide2.png'),
        SizedBox(
          height: 40,
        ),
        Text(
          "Delicious Dishes",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Experience a variety of amazing dishes from\ndifferent cultures around the world",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.black45),
        )
      ],
    );
  }
}
