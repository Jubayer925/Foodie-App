import 'package:flutter/material.dart';


class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _Cartpage();
}

class _Cartpage extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Cart page"),
      ),
    );
  }
}
