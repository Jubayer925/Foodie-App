import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf1f1f1),
      appBar: AppBar(
        title: Text("Foodie",style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.red,
              child: Icon(Icons.shopping_cart, color: Colors.white,size: 20,),
            ),
          )

        ],
        backgroundColor: Color(0XFFf1f1f1) ,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: [
              //Food Category
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Food Category",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black54),),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 70, width: double.infinity,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 70,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    );
                    }),
              ),

              //Popular dishes
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Popular Dishes",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black54),),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 300, width: double.infinity,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      );
                    }),
              ),

              //Chef's Special
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Chef's Special",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.black54),),
                ],
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 100, width: double.infinity,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      );
                    }),
              ),


            ],
        ),
      )
    );
  }
}
