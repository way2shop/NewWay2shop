import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:a/Shopers/Additem.dart';
import 'package:a/Shopers/ShopHome.dart';
import 'package:a/widgets/Lists.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/MainProvider.dart';
import '../widgets/HomeButton.dart';

class Stockdt extends StatelessWidget {
  const Stockdt({super.key});

 // get index => null;

  //get index => num;

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider =   Provider.of<MainProvider>(context, listen: false);
    mainProvider.getItem();

    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: false,
        backgroundColor:Color(0xff650015),

        title: Text("Stock Details",
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),


        ),
       /* leading: InkWell(onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShopHome()),
        );
        }, child: Image.asset("lib/icons/img_1.png")
    ),*/
      ),

//SizedBox(height: 20,),
      body: Column(

          children: [
            Expanded(
              flex: 4,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.separated(
                    itemCount: value.allAdditem.length,

                      itemBuilder: (context, index) {
                      var items = value.allAdditem[index].toString();
                      print(value.allAdditem[index].name);
                      print(value.allAdditem[index].quantity);
                      print(value.allAdditem[index].code);
                        return Container(
                          width: double.infinity,
                          height: 115,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 80,
                                height: 76,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(width: 1, color: Color(0xff650015)),
                                  ),
                                ),
                                 child:Icon(Icons.image_outlined,color: Colors.grey,size: 30,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text( value.allAdditem[index].name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text( value.allAdditem[index].code,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                               ),


                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Text(value.allAdditem[index].quantity.toString(),style: TextStyle(fontSize: 24)),
                                    SizedBox(height: 5,),
                                    InkWell(
                                      onTap: (){
                                        showDialog(context: context, builder: (context){
                                          return Container(
                                            child: AlertDialog(

                                              actions: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(15),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                                                        children: [

                                                          InkWell(
                                                              child: HomeButton(
                                                                  textColor: Color(0xFA005A54),
                                                                  backgroundColor: Color(0xFFDBE3E3),
                                                                  boxshadowColor: Colors.grey,
                                                                  borderColor: Color(0xFFDBE3E3), text: "-",
                                                                  hight: 37, width:62 , fondSize: 30)),
                                                          Text("203",style: TextStyle(fontSize: 40),),
                                                          InkWell(
                                                              child: HomeButton(
                                                                  textColor: Color(0xFA005A54),
                                                                  backgroundColor: Color(0xFFDBE3E3),
                                                                  boxshadowColor: Colors.grey,
                                                                  borderColor: Color(0xFFDBE3E3),
                                                                  text: "+", hight: 37, width:62 , fondSize: 30)),

                                                        ],
                                                      ),
                                                    ),
                                                    Center(
                                                      child: MaterialButton(onPressed: (){ Navigator.pop(
                                                        context,
                                                        /* MaterialPageRoute(
                                                        builder: (context) => const Additem()),*/
                                                      );

                                                      },
                                                        child: const Text("ok"),
                                                        highlightColor: Color(0xff0C630A),
                                                        splashColor: Colors.grey,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                              ],

                                            ),
                                          );
                                        });
                                      },
                                      child: HomeButton(textColor: Colors.black, backgroundColor: Colors.blueAccent, boxshadowColor: Colors.grey, borderColor: Colors.blueAccent, text: "Update", hight: 33, width: 126,
                                          fondSize: 14),
                                    ),
                                  ],
                                ),
                              ),

                            ],

                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(color:Color(0xff650015),height: 3,);
                      },
                  );
                }
              ),
            )

          ],
        ),



bottomNavigationBar:
    Container(
      height: 50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),),
      child: MaterialButton(onPressed: (){ Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Additem()),
      );
        //mainProvider.getItem();
        print("fun.............................................");

      },
        child: const Text("Add New"),
        highlightColor: Color(0xff0C630A),
        splashColor: Colors.grey,
        color: Colors.green,
      ),
    )

    );
  }
}
