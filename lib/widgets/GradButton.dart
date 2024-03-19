import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class GradButton extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final Color? boxshadowColor;
  final Color? borderColor;
  final String? text;
  //final AssetImage assetImage;
  double? width;
  double? hight;
  double? fondSize;

  GradButton({super.key,
     this.textColor,
    this.backgroundColor,
    this.boxshadowColor,
     this.borderColor,

     this.text,
   // required this.assetImage,
     this.hight,
     this.width,
    this.fondSize,



  }
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: width??185,
        height: hight??55,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff8FC7C3), Colors.white],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border(
            left: BorderSide(color:borderColor??Colors.white),
            top: BorderSide(color:borderColor??Colors.white),
            right: BorderSide(color:borderColor??Colors.white),
            bottom: BorderSide(width: 1.20, color: borderColor??Colors.white),
          ),
          boxShadow: [
            BoxShadow(
              color: boxshadowColor??Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Column(
            children: [

              //Image(image:assetImage), // Using AssetImage

               // height: 95,),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(text??"",
                  style: TextStyle(
                    color: textColor,
                    fontSize: fondSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ) ,



      ),
    );

  }

}







