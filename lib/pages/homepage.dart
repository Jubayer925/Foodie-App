import 'package:flutter/material.dart';
import 'package:foodie_app/pages/cartpage.dart';
import 'package:foodie_app/pages/catitemspage.dart';
import 'package:foodie_app/pages/dishdetailspage.dart';
import 'package:foodie_app/provider/food_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<FoodProvider>(context, listen: false).fetchFoodData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFf1f1f1),

        //AppBar
        appBar: AppBar(
          title: Text(
            "Foodie",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cartpage()));
                  }),
            )
          ],
          backgroundColor: Color(0XFFf1f1f1),
        ),

        //Body
        body: Consumer<FoodProvider>(
          builder: (context, foodProvider, child) {
            if (foodProvider.isLoading) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.red, size: 50),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  //TODO: Food Category ==========================================
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Food Category",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: foodProvider.categories.length,
                        itemBuilder: (context, index) {
                          final category = foodProvider.categories[index];
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CatItemspage(itemId: category.id, itemTitle: category.title,)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 70,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.network(
                                      category.image,
                                      height: 45,
                                      width: 45,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                          text: category.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ),
                          );

                        }),
                  ),

                  //TODO: Popular dishes =========================================
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Popular Dishes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: foodProvider.popularItems.length,
                        itemBuilder: (context, index) {
                          final popular = foodProvider.popularItems[index];
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Dishdetailspage(title: popular.name, description: popular.description, calories: popular.calories, image: popular.image)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 300,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      popular.name,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image.network(
                                      popular.image,
                                      height: 200,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        popular.calories.toString() + " Calories",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ]),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          popular.description,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      )
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),

                  //TODO: Chef's Special =================================
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Chef's Special",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: 10),
                        scrollDirection: Axis.horizontal,
                        //itemCount: 1,
                        itemCount: foodProvider.specialItems.length,
                        itemBuilder: (context, index) {
                          final special = foodProvider.specialItems[index];
                          return Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Dishdetailspage(title: special.name, image: special.image, calories: special.calories, description: special.description,)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        special.image,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            special.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "${special.calories} Calories",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          Text(
                                            special.description,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
