import 'package:a/customer/Caccount.dart';
import 'package:a/customer/Ccategory.dart';
import 'package:a/customer/Cshops.dart';
import 'package:a/customer/Ordersummery.dart';
import 'package:a/customer/cartpage.dart';
import 'package:a/customer/user_registration.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:a/widgets/GradButton.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';


import '../IntegrateGoogleMap.dart';
import '../providers/MainProvider.dart';
import '../widgets/HomeButton.dart';
import 'Ctrending.dart';

class Cproduct extends StatelessWidget {
  String itemid;
  List photo;
  String itemname;
  String price;
  String category;
  String categoryid;
  String description;
  String itemquartity;
  String offers;
  String color;
  String brand;
  String productdiemension;
  String assmbly;
  String shopname;
  String phone;
  String shopdetails;
  String place;
  String userId;
  String userName;
  String userPhone;
  String shopid;
  double latitude,longitude;


  String instruction;
   Cproduct({super.key,required this.itemid,required this.photo,required this.itemname,required this.price,
     required this.category,required this.categoryid,required this.description,
     required this.itemquartity,required this.offers,required this.color,required this.brand,
     required this.productdiemension,required this.assmbly,
     required this.instruction,required this.shopname,required this.phone,
     required this.shopdetails,required this.place,required this.userId,required this.userName,
     required this.userPhone,required this.shopid, required this.latitude,required this.longitude
   });

  @override
  Widget build(BuildContext context) {

    print("rrrrrrrrrrrrrrrrrrr $userName");
    print("ffff $userId");
    print("ffff $userPhone");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff800026),


        title: Text("Way2Shop",
          style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),



        ),
      ),
      body:
      SingleChildScrollView(

        child: Column(
          children: [
            // Container(width:double.infinity ,
            //   height: 130,
            //   decoration: BoxDecoration(color: Color(0xff650015)),
            //   child: Column(
            //     children: [
            //       // Center(
            //       //   child: Container(
            //       //     height: 50,
            //       //     width:360 ,
            //       //
            //       //     child: TextField(decoration: InputDecoration(
            //       //       border: OutlineInputBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomRight: Radius.circular(15)),),
            //       //       fillColor: Colors.white24,
            //       //       filled: true,
            //       //       focusedBorder: InputBorder.none,
            //       //       hintText:"Search...",
            //       //       hintStyle:TextStyle(color: Colors.white),
            //       //       prefixIcon: Icon(Icons.search,color: Colors.white,),
            //       //       suffixIcon: Icon(Icons.mic,color: Colors.white,),
            //       //     ),
            //       //     ),
            //       //   ),
            //       // ),
            //       //SizedBox(height: 10,),
            //
            //       Container(
            //         decoration: BoxDecoration( image: DecorationImage(image: AssetImage("assets/img.png", )),),
            //         width:30,),
            //
            //     ],
            //   ),
            //
            // ),
            // Container(
            //   width:double.infinity ,
            //   height: 39,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [Color(0xff650015), Color(0xff7E0922)],
            //
            //       begin: Alignment.bottomCenter,
            //       end: Alignment.topCenter,
            //     ),
            //   ),
            //
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [



                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                       return  Image.network(photo[index]);
                      },
                     
                      options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                    ), itemCount: photo.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      //height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              child: Text("",style: TextStyle(fontSize: 24,color: Colors.black54),)),
                          Text(itemname
                              // "House of Quirk Electric Baby Rocker,Bassinet on Bed , "
                              // "Height Adjustable Cot Bed with Comfortable Mattress,"
                              // "Portable Baby Nursey with 82 cm Sleeping Basket and 5 Swing Speeds(Grey)"
                          ),
                          Row(
                            children: [
                              Text(offers+ "%off",style: TextStyle(fontSize: 18,color: Colors.green),),
                              SizedBox(width: 10,),
                              Icon(Icons.currency_rupee,size: 30,),
                              Text(price,style: TextStyle(fontSize: 30),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star,size:18,color: Colors.orange,),
                              Icon(Icons.star_half,size:18,color: Colors.orange,),
                              Icon(Icons.star_border,size:18,color: Colors.orange,),
                              SizedBox(width: 20,),
                              Text("1,014 Ratings",style: TextStyle(fontSize: 16,color: Colors.black26),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(alignment: Alignment.centerLeft,child: Text("Variations",style: TextStyle(fontSize: 15,color: Colors.black38),)),
                          ),

                          // Row(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          //       child: Container(
                          //         height: 100,
                          //         width: 80,
                          //         decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                          //         borderRadius:  BorderRadius.circular(20)),
                          //         child: Column(
                          //           children: [
                          //             Image(image: AssetImage("assets/Pink_kidnox.png"),width: 70,),
                          //             Text("Pink",style: TextStyle(fontSize: 18),)
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          //       child: Container(
                          //         height: 100,
                          //         width: 80,
                          //         decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                          //             borderRadius:  BorderRadius.circular(20)),
                          //         child: Column(
                          //           children: [
                          //             Image(image: AssetImage("assets/blue_kidnox.png"),width: 70,),
                          //             Text("Pink",style: TextStyle(fontSize: 18),)
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          //       child: Container(
                          //         height: 100,
                          //         width: 80,
                          //         decoration: BoxDecoration(border: Border.all(color: Colors.black38),
                          //             borderRadius:  BorderRadius.circular(20)),
                          //         child: Column(
                          //           children: [
                          //             Image(image: AssetImage("assets/Pink_kidnox.png"),width: 70,),
                          //             Text("Pink",style: TextStyle(fontSize: 18),)
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                          color: Colors.white
                          ,child: Text("   Product Details",style: TextStyle(fontSize:25),)),
                      Container(
                        //height: 130,
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Item Name           "+itemname),
                              SizedBox(height: 4,),
                              // Text("Item Quandity          "+itemquartity),
                              // SizedBox(height: 4,),
                              Text("Colour  :  "+color),
                              SizedBox(height: 4,),
                              Text("Brand : "+brand),
                              SizedBox(height: 4,),
                              Text("Product Dimensions   : "+productdiemension),
                              SizedBox(height: 4,),
                             // Text("Description     "+description),
                              //Text("Product Care         "+productcare),

                            ],
                          ),
                        ),
                      ),
                      Divider(),
                      Container(
                          width: double.infinity,
                          color: Colors.white
                          ,child: Text("  About this item",style: TextStyle(fontSize:25),)),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [
                            Text(instruction),
                            // Text("\u2022  "+"Space-saving and portable: this baby swing has a very strong folding function and saves space."),
                            // Text("\u2022  "+"ADJUSTABLE HEIGHT: Simply change the height of the baby bed according to your needs."),
                            // Text("\u2022  "+"Music: Can Be Connected to the Mobile Phone to Play the Baby‘s Favorite Music"),
                          ],),
                        ),
                      ),

                    ],),
                  ),
                  Divider(),
                  Container(
                      width: double.infinity,
                      color: Colors.white
                      ,child: Text("Additional Informations",style: TextStyle(fontSize:25),)),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Text(assmbly),
                        // Text("\u2022  "+"Space-saving and portable: this baby swing has a very strong folding function and saves space."),
                        // Text("\u2022  "+"ADJUSTABLE HEIGHT: Simply change the height of the baby bed according to your needs."),
                        // Text("\u2022  "+"Music: Can Be Connected to the Mobile Phone to Play the Baby‘s Favorite Music"),
                      ],),
                    ),
                  ),
                  Divider(),
                  Container(
                    width: double.infinity,
                    color: Colors.black12,
                    child: Column(children: [
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return Container(
                            width: double.infinity,
                            color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Align(alignment:Alignment.centerLeft ,
                                        child: Text("Shop Details",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                    Align(alignment:Alignment.centerLeft ,child: Text(shopname,)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Align(alignment:Alignment.centerLeft ,child: Text("Phone: "+value.shopPhone),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0),
                                      child: Align(alignment:Alignment.centerLeft ,child: Text("Hours: "+"Open.Closes 9 pm"),),
                                    ),


                                    Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,size: 36,color: Colors.black38,),
                                        Column(
                                          children: [
                                            Text(value.shopDetails,style: TextStyle(fontSize: 12),),
                                            Align(alignment:Alignment.centerLeft ,
                                              child: InkWell(
                                                onTap: (){
                                                  MapUtils.launchMaps(latitude,longitude,value.latitude,value.longitude);
                                                },
                                                  child: Text("Show Map",style: TextStyle(fontSize: 12,color: Colors.black38))),),

                                          ],
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),

                          );
                        }
                      ),


                    ],),
                  ),
                  Divider(),

                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar:BottomAppBar(


        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 45,
              width: 50,
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.black26),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Icon(Icons.messenger_outline,),
            ),
            InkWell(
              onTap: (){Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (
                        context) => const cartpage()),
              );},
              child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(border: Border.all(
                    color: Colors.black26),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text("Add To Cart",style: TextStyle(fontSize: 18),)),
              ),
            ),

            Consumer<MainProvider>(
              builder: (context3,provider,_) {
                return  Consumer<LoginProvider>(
                    builder: (context4,log,_) {
                    return InkWell(
                      onTap: (){
                        if (log.loginedUserName.isEmpty) {
                          log.clearRegControlls();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserRegistration(),
                              ));
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content:
                            Text("Sorry , Login to your account to place an order!"),

                          ));
                        }else{
                          print(userPhone+userName+userId+"hhhhhhhhh");
                          showDialog(context: context, builder: (context){
                            return AlertDialog(backgroundColor: Colors.white,
                              elevation: 0,

                              actions: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),



                                    ),

                                    Text("Do you want to Confirm your order ? "),
                                    Row(
                                      children: [
                                        MaterialButton(onPressed: (){ Navigator.pop(
                                          context,
                                          /* MaterialPageRoute(
                                                                builder: (context) => const Additem()),*/
                                        );

                                        },
                                          child: const Text("cancel"),
                                          highlightColor: Color(0xff0C630A),
                                          splashColor: Colors.grey,
                                          color: Colors.red,
                                        ),

                                        SizedBox(width: 10,),

                                        MaterialButton(
                                          onPressed: (){

                                            print(userPhone+userName+userId+"hhhhhhhhh");

                                            provider.addConfirmOrder(itemname, price, itemid,userId,shopid,userName,userPhone);
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content:
                                              Text("Ordered Successfully"),
                                              duration: Duration(milliseconds: 3000),
                                            ));



                                          },
                                          child: const Text("ok",
                                          ),
                                          highlightColor: Color(0xff0C630A),
                                          splashColor: Colors.grey,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ],

                            );
                          });
                        }

                      },
                      child: Container(
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(border: Border.all(
                            color: Colors.black26),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.yellow[600]
                        ),
                        child: Center(child: Text("Place Order",style: TextStyle(fontSize: 18),)),
                      ),
                    );
                  }
                );
              }
            ),


          ],
        ),
      ),


      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor:Colors.white ,
      //   color: Color(0xff10706A),
      //   animationDuration: Duration(milliseconds: 300),
      //   onTap: (index){},
      //   // items: [
      //   //   Icon(Icons.trending_up,color: Colors.white,),
      //   //   Icon(Icons.category_outlined,color: Colors.white),
      //   //   Icon(Icons.shop_2_outlined,color: Colors.white),
      //   //   Icon(Icons.account_circle_outlined,color: Colors.white)
      //   //
      //   // ],
      //   items: [
      //     InkWell(onTap: (){ Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ctrending()),
      //     );
      //     },child: const Icon(Icons.trending_up,color: Colors.white,)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Ccategory()),
      //     );}, child: const Icon(Icons.category_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Cshops()),
      //     );}, child: const Icon(Icons.shop_2_outlined,color: Colors.white)),
      //     InkWell(onTap: (){Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => const Caccount()),
      //     );}, child: const Icon(Icons.account_circle_outlined,color: Colors.white))
      //
      //
      //   ],
      //
      // ),


    );
  }
}
