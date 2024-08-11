import'package:flutter/material.dart';

class PopularItemsWidget extends StatelessWidget{
  @override
  Widget  build(BuildContext context) {
    return  Column(
      children: [
       const Padding(
        padding: 
        EdgeInsets.only(
        top :20, left:25, bottom: 5, right: 10), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
                "POPULAR",
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
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(int i=7; i<11;i++)
          Container(
            //margin: EdgeInserts.all(10),
            //padding: EdgeInserts.all(5),
            height: 100,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow:[
                 BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
              ) 

              ]
            ),
            child: Image.asset("images/$i.png"),
          )
        ],),
      )
      ],
    );
}
}