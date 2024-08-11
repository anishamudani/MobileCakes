
import 'package:flutter/material.dart';
import 'package:untitled/pages/ItemPage.dart';

import '../models/all_items_model.dart';

class ItemsWidget extends StatefulWidget {
  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TOP",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A368),
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        GridView.builder(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: AllItemsModel.allItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),

            itemBuilder: (context, index) {
              final mainItem = AllItemsModel.allItems[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                      )
                    ]),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ItemPage(
                              name: mainItem["name"],
                              price: mainItem["price"],
                              imageProvider: mainItem["image"],
                              rating: mainItem["rating"],
                              description: mainItem["description"]

                          );
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            mainItem["image"],
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      // SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            mainItem["name"],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF555555)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${mainItem["size"]} Sized",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF555555)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$ ${mainItem["price"]}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00A368),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00A368),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
        ),
      ],
    );
  }
}
