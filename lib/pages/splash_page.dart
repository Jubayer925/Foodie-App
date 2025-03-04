import 'package:flutter/material.dart';
import 'package:foodie_app/pages/onboarding/onboarding_main.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});


  @override
  State<SplashPage> createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingMain()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/icon.png", height: 150,width: 150,),
          SizedBox(height: 20,),
              Text("FOODIE",style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold),)
            ],
        ),
      )
      ,
    );
  }
}
