import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Costfield extends StatelessWidget {
  final String hintText;

  var validator;

  Costfield({super.key,
    this.width,
     this.hight,
    required this.hintText,
    this.ItemController,
    this.validator,
   // required String? Function(dynamic value) validator,

  });
  TextEditingController? ItemController;
  double? width;
  double? hight;

  @override
  Widget build(BuildContext context) {
    return 
      Opacity(
        
        opacity: 1,
        child: Container(
        width: width??296,
        height: hight??50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
        
        
        
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        
        child: TextField(controller: ItemController,decoration: InputDecoration(
          //border: OutlineInputBorder(),),
         // fillColor: Colors.white24,
          filled: true,
          fillColor: Color(0xFF650015).withOpacity(0.8),

          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(15)) ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

          hintText:hintText,
          hintStyle:TextStyle(color: Colors.grey),
         // prefixIcon: Icon(Icons.search,color: Colors.white,),
         // suffixIcon: Icon(Icons.mic,color: Colors.white,),
        ),
        ),
            ),
      );


  }
}
