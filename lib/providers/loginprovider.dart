

import 'dart:collection';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


import '../Admin/AdmnHome.dart';
import '../Shopers/ShopHome.dart';
import '../customer/Custhome.dart';
import '../customer/varification.dart';
import 'MainProvider.dart';

class LoginProvider extends ChangeNotifier {


  TextEditingController loginusername=TextEditingController();
  TextEditingController Loginphnnumber=TextEditingController();
  TextEditingController otpverifycontroller = TextEditingController();
  void controlllerclear(){
    loginusername.clear();
    Loginphnnumber.clear();

  }

  String VerificationId = "";

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  bool loader =false;
  void sendotp(BuildContext context) async {
    loader = true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${Loginphnnumber.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
            Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader =false;
        notifyListeners();

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Verification(),
            ));
        ScaffoldMessenger.of(context)
            .showSnackBar( SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        Loginphnnumber.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }
  void verify(BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: otpverifycontroller.text);
    await auth.signInWithCredential(credential).then((value) {
      final user = value.user;
      if (user != null) {

        userAuthorized(user.phoneNumber, context);
      } else {
        if (kDebugMode) {
        }
      }
    });
  }


  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {
    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';

    String userId='';
    String loginphno="";
    String loginPhoto="";
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USERS").where("PHONE_NUMBER",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['USER_NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE_NUMBER"].toString();
            loginUserid = element.id;
            userId = map["USER_ID"].toString();
            String uid = userId;
            if (loginUsertype == "ADMIN") {
              print("cb bcb");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdmnHome(),
                  ));

            }
            else if(loginUsertype == "SHOPKEEPERS") {
              print("mxnxn");

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopHome(),
                  ));
            }else{
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Custhome(),
                  ));

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}