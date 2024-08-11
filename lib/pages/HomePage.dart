import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/all_items_model.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import '../widgets/BottomCartSheet.dart';
import '../widgets/CategoriesWidget.dart';
import '../widgets/ItemsWidget.dart';
import '../widgets/PopularItemsWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool searchFound = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void searchDialogResults() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: AllItemsModel.results.length > 0
                    ? ListView.builder(
                        itemCount: AllItemsModel.results.length,
                        itemBuilder: (context, index) {
                          final currentItem = AllItemsModel.results[index];
                          return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      currentItem["image"],
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            currentItem["name"],
                                            style: const TextStyle(
                                              color: Color(0xFF00A368),
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "\$${currentItem["price"].toString()}",
                                            style: const TextStyle(
                                              color: Color(0xFF00A368),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ])
                                ],
                              ));
                        })
                    : const Text(
                        "Search not found :D",
                        style: TextStyle(
                          color: Color(0xFF00A368),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          );
        },
      );
    }

    final count = Provider.of<CartModel>(
      context,
    ).getTotalCartItems();

    return Scaffold(
      backgroundColor: const Color(0xFF001368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: const EdgeInsets.only(right: 20, left: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: const Color(0XFF00A368),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.5),
                              blurRadius: 2,
                            ),
                          ]),
                      child: GestureDetector(
                        child: badges.Badge(
                          badgeContent: Text(
                            count.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: Colors.red,
                            padding: EdgeInsets.all(6),
                          ),
                          child: InkWell(
                            onTap: () {
                              showSlidingBottomSheet(
                                context,
                                builder: (context) {
                                  return SlidingSheetDialog(
                                      elevation: 8,
                                      cornerRadius: 16,
                                      builder: (context, state) {
                                        return BottomCartSheet();
                                      });
                                },
                              );
                            },
                            child: const Icon(
                              CupertinoIcons.cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "What cake would you want",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              // search widget
              Container(
                // margin: EdgeInsets.all(15),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 250,
                      child: TextFormField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: "Search here...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          AllItemsModel.searchResults(searchController.text);
                          // if(AllItemsModel.)
                          searchDialogResults();
                        },
                        icon: const Icon(Icons.filter_list)),
                  ],
                ),
              ),
              // products widgets
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.only(top: 20),
                width: 3000,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoriesWidget(),
                      PopularItemsWidget(),
                      ItemsWidget(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
