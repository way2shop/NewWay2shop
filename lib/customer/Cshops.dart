import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:a/widgets/GradButton.dart';

import 'Caccount.dart';
import 'Ccategory.dart';
import 'Ctrending.dart';

class Cshops extends StatelessWidget {
  const Cshops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:const Color(0xff650015),

        title: const Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),


        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(width:double.infinity ,
              height: 130,
              decoration: const BoxDecoration(color: Color(0xff650015)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 50,
                      width:360 ,

                      child: const TextField(decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white10), borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
                        fillColor: Colors.white10,
                        filled: true,
                        focusedBorder: InputBorder.none,
                        hintText:"Search",
                        hintStyle:TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.search,color: Colors.white,),
                        suffixIcon: Icon(Icons.mic,color: Colors.white,),
                      ),
                      ),
                    ),
                  ),
                  //SizedBox(height: 10,),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Container(

                            width:30,
                            child: Image.asset("lib/icons/img.png")),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(

                            width:30,
                            child: Image.asset("lib/icons/cart.png")),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(

                            width:30,
                            child: Image.asset("lib/icons/Order.png")),
                      ),
                    ],
                  ),








                ],
              ),

            ),
            Container(
              width:double.infinity ,
              height: 39,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff650015), Color(0xff7E0922)],

                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                ),
              ),

            ),
                Padding(
                padding: const EdgeInsets.all(10),
    child: Text("Shops",style: TextStyle(fontSize: 20),),
    ),
    //ListView(
    // children: [
   
    SizedBox(height: 10,),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    SizedBox(width: 1,),
    GradButton(text: "Shope name",),
      SizedBox(width: 1,),
      GradButton(text: "Shope name",),
      SizedBox(width: 1,),
    ],
    ),
    SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
                GradButton(text: "Shope name",),
                SizedBox(width: 1,),
              ],
            ),
            SizedBox(height: 10,),

    ],
    ),
      ),



    );
  }
}


