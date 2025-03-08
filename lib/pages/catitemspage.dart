import 'package:flutter/material.dart';
import 'package:foodie_app/provider/cat_item_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import 'dishdetailspage.dart';

class CatItemspage extends StatelessWidget {
  final String itemTitle;
  final String itemId;

  const CatItemspage({required this.itemId, required this.itemTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatItemsProvider()..fetchItems(itemId),
      child: Scaffold(
        backgroundColor: Color(0XFFf1f1f1),
        appBar: AppBar(
          backgroundColor: Color(0XFFf1f1f1),
          title: Text(itemTitle,style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: Consumer<CatItemsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.red, size: 50),
              );
            }

            return ListView.builder(
                itemCount: provider.catItems.length,
                itemBuilder: (context, index) {
                  final items = provider.catItems[index];
                  return Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Dishdetailspage(title: items.name, description: items.description, calories: items.calories, image: items.image)));
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(items.image,
                              width: 50, height: 50, fit: BoxFit.cover),
                        ),
                        title: Text(
                          items.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Expanded(
                            child: Text(
                          items.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
