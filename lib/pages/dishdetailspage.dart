import 'package:flutter/material.dart';


class Dishdetailspage extends StatefulWidget {
  final String image ;
  final String title;
  final int calories;
  final String description;
  
   Dishdetailspage({required this.title, required this.description, required this.calories, required this.image});

  @override
  State<Dishdetailspage> createState() => _DishdetailspageState();
}

class _DishdetailspageState extends State<Dishdetailspage> {

  late String image ;
  late String title;
  late int calories;
  late String description;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    image = widget.image;
    title = widget.title;
    calories = widget.calories;
    description = widget.description;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 350,
        automaticallyImplyLeading: false,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              image, // Image URL
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 40, // Adjust as needed
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  child: Row(
                    children: [
                      //IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios, color: Colors.blueAccent,)),
                      Text("< Back",style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 20), )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text("$calories Calories",style: TextStyle(fontSize: 15, color: Colors.red))
                ],
              ),
              SizedBox(height: 20,),
              Text(description,style: TextStyle(fontSize: 18),),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                    fixedSize: Size(300, 50)
                  ),
                  child: Text("Order now",style: TextStyle(color: Colors.white, fontSize: 20),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
