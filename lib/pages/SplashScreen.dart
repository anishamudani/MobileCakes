import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              height: 300,
            ),
            
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "WELCOME TO CAKE BOSS",
                style: TextStyle(
                    color: Color(0xFF00A368),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                
                ),
              ),
           const SizedBox(height: 50,),
            InkWell(
              onTap: (){
                // pushReplacementnamed so it cannot go back to splash screen
                 Navigator.pushReplacementNamed(context, "homePage");
              } ,
              // FOR ANIMATION ON CONTAINER
             
            
              // for animation on container
               child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF00A368),
                ) ,
                child: const Text(
                "GET STARTED",
                style: TextStyle(
                  color: Color.fromARGB(221, 241, 238, 238),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),  
              ),
            ),
            ),
          ],
            
        )  
      ),
      );
     
  }   
  }

