import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/cart_model.dart';

class BottomBar extends StatefulWidget {
  final String name;
  final int price;
  final String imageProvider;
  final int count;

  const BottomBar({
    super.key,
    required this.name,
    required this.price,
    required this.imageProvider,
    required this.count,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();

}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.price.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00A368),
              ),
            ),
            InkWell(
              onTap: () {
                Provider.of<CartModel>(context, listen: false).appendList(
                    widget.name,
                    widget.price,
                    widget.count,
                    widget.imageProvider
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF00A368),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 28,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
