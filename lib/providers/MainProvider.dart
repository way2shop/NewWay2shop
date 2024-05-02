import 'dart:collection';
import 'dart:io';


import 'package:a/Model/ItemModel.dart';
import 'package:a/providers/loginprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MainProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Reference ref = FirebaseStorage.instance.ref("IMAGE URL");


  TextEditingController itemNm = TextEditingController();
  TextEditingController itemCd = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController Upquantity = TextEditingController();
  TextEditingController Upid = TextEditingController();

  TextEditingController cost = TextEditingController();

  TextEditingController category = TextEditingController();

  List <ItemModel> allAdditem = [];
  List <ItemModel> searchAllitem = [];

  TextEditingController addcategory = TextEditingController();

  TextEditingController owname = TextEditingController();
  TextEditingController phnu = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController shopname = TextEditingController();
  TextEditingController shopdetails = TextEditingController();
  TextEditingController  idprooof= TextEditingController();
  TextEditingController  licence= TextEditingController();
  TextEditingController reciept = TextEditingController();
  TextEditingController licenceid = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController loginLicenceId = TextEditingController();
  TextEditingController loginpassword = TextEditingController();

  TextEditingController offers = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController diamention = TextEditingController();
  TextEditingController requirements = TextEditingController();
  TextEditingController productcare = TextEditingController();
  TextEditingController instruction = TextEditingController();

  String productSelectedCategoryID="";
  String SelectedShopID="";
  String SelectedPlaceID="";

// Add item Details

  File? itemfileimage=null;
  String itemimg="";

  Future<void> upload() async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> itemmap = HashMap();

    itemmap["Item Name"] = itemNm.text;
    itemmap["Price"] = price.text;
    itemmap["color"] = color.text;
    itemmap["Category"] = addcategory.text;
    itemmap["Shop name"] = shopname.text;
    itemmap["description"] =description.text;
    itemmap["Item Quantity"] = quantity.text;
    itemmap["Item Id"] = id;
    itemmap["Offers"] = offers.text;
    itemmap["Brand"] = brand.text;
    itemmap["Product Dimensions"] = diamention.text;
    itemmap["Assembly Required"] = requirements.text;
    itemmap["Product Care"] = productcare.text;
    itemmap["Instructions"] =instruction.text;
    itemmap["Category_id"] =productSelectedCategoryID;
    itemmap["Shop_id"] =SelectedShopID;
    if (itemfileimage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(itemfileimage!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          itemmap ["PHOTO"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      itemmap['PHOTO'] = itemimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    db.collection("ITEMS").doc(id).set(itemmap);
    notifyListeners();
    print("Upload Succesfully");
  }
  void setImage1(File image) {
    itemfileimage = image;
    notifyListeners();
  }

  Future getitemImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage1(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getitemImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImage1(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await
    imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());

  }


  void takePicture() async {
    final XFile? picture = await imagePicker.pickImage(source: ImageSource.camera);
    if (picture != null) {
      imageFileList!.add(picture);
    }
    print("Image List Length: ${imageFileList!.length}");
  }
  // View the Items
   void getItem(String catid){
    db.collection("ITEMS").where("Category_id",isEqualTo: catid).get().then((value)
      {
        allAdditem.clear();
       // totalAmount = 0.0;
        print("object.................");
        if(value.docs.isNotEmpty){
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data() as Map;
            allAdditem.add(ItemModel(
           map["Item Id"].toString(),
           map["PHOTO"].toString(),
           map["Item Name"].toString(),
           map["Price"].toString(),
           map["Category"].toString(),
           map["Category_id"].toString(),
           map["description"].toString(),
           map["Item Quantity"].toString(),
           map["Offers"].toString(),
           map["color"].toString(),
           map["Brand"].toString(),
           map["Product Dimensions"].toString(),
           map["Assembly Required"].toString(),
           map["Product Care"].toString(),
           map["Instructions"].toString(), map["Place"].toString(),

            ));
            notifyListeners();

          }
          notifyListeners();

        }
      });
  }

   void getSearchProducts(String productName,String location){
    db.collection("ITEMS")
        .where("Item Name",isEqualTo: productName,)
        .where("Place",isEqualTo: location,)
        .get().then((value)
      {
        searchAllitem.clear();
       // totalAmount = 0.0;
        print("object.................");
        if(value.docs.isNotEmpty){
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data() as Map;
            searchAllitem.add(ItemModel(
           map["Item Id"].toString(),
           map["PHOTO"].toString(),
           map["Item Name"].toString(),
           map["Price"].toString(),
           map["Category"].toString(),
           map["Category_id"].toString(),
           map["description"].toString(),
           map["Item Quantity"].toString(),
           map["Offers"].toString(),
           map["color"].toString(),
           map["Brand"].toString(),
           map["Product Dimensions"].toString(),
           map["Assembly Required"].toString(),
           map["Product Care"].toString(),
           map["Instructions"].toString(),
              map["Place"].toString(),
            ));
            notifyListeners();

          }
          notifyListeners();

        }
      });
  }

  // void searchlocation(){
  //   db.collection("")
  //
  //
  // }

  var q;
  var Uid;
  void incrementInteger() {

    print('function called');
    print(Upquantity);
    q = int.tryParse(Upquantity.text);
    Uid = int.tryParse(Upid.text);
    print(Uid);
    print(q);
    int.parse(q);
    // final user = <String, dynamic>{
    //
    //   "Item Name": itemNm.text,
    //   "item Code": itemCd.text,
    //   "Price": price.text,
    //   "Item Quantity": quantity.text,
    //   "Category": category.text,
    //
    //
    // };


    // db.collection("ITEMS").doc(itemCd.text.toString()).set(user);
    // notifyListeners();
    print("Upload Succesfully");
  }

  void getallItems(){
    db.collection("ITEMS").get().then((value)
    {
      allAdditem.clear();
      // totalAmount = 0.0;
      print("object.................");
      if(value.docs.isNotEmpty){
        for(var element in value.docs) {
          Map<dynamic, dynamic> map = element.data() as Map;
          allAdditem.add(ItemModel(
            map["Item Id"].toString(),
            map["PHOTO"].toString(),
            map["Item Name"].toString(),
            map["Price"].toString(),
            map["Category"].toString(),
            map["Category_id"].toString(),
            map["description"].toString(),
            map["Item Quantity"].toString(),
            map["Offers"].toString(),
            map["color"].toString(),
            map["Brand"].toString(),
            map["Product Dimensions"].toString(),
            map["Assembly Required"].toString(),
            map["Product Care"].toString(),
            map["Instructions"].toString(),
           map["Place"].toString(),
          ));
          notifyListeners();

        }
        notifyListeners();

      }
    });
  }


  void getshopitem(String shopid){
    db.collection("ITEMS").where('Shop_id',isEqualTo :shopid ).get().then((value)
    {
      allAdditem.clear();
      // totalAmount = 0.0;
      print("object.................");
      if(value.docs.isNotEmpty){
        for(var element in value.docs) {
          Map<dynamic, dynamic> map = element.data() as Map;
          allAdditem.add(ItemModel(
            map["Item Id"].toString(),
            map["PHOTO"].toString(),
            map["Item Name"].toString(),
            map["Price"].toString(),
            map["Category"].toString(),
            map["Category_id"].toString(),
            map["description"].toString(),
            map["Item Quantity"].toString(),
            map["Offers"].toString(),
            map["color"].toString(),
            map["Brand"].toString(),
            map["Product Dimensions"].toString(),
            map["Assembly Required"].toString(),
            map["Product Care"].toString(),
            map["Instructions"].toString(),
            map["Place"].toString(),
          ));
          notifyListeners();

        }
        notifyListeners();

      }
    });
  }

  void stupload() {


    final user = <String, dynamic>{

      "Item Name": itemNm.text,
      "item Code": itemCd.text,
      "Price": price.text,
      "Item Quantity": quantity.text,
      "Category": category.text,


    };


    db.collection("ITEMS").doc(itemCd.text.toString()).set(user);
    notifyListeners();
    print("Upload Succesfully");
  }


  void adduser(BuildContext context,String type){
    LoginProvider loginProvider = Provider.of<LoginProvider>(context, listen: false);

    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> usermap = HashMap();
    usermap["USER_ID"]= id;
    usermap["USER_NAME"]= loginProvider.loginusername.text;
    usermap["PHONE_NUMBER"]= "+91"+loginProvider.Loginphnnumber.text;
    usermap["TYPE"]= type;
    usermap["STATUS"]= "ACTIVE";
    db.collection("USERS").doc(id).set(usermap);

  }








  File? categoryfileimg;
  String categoryimg  ="";
  Future<bool> checkPlaceExist(String place) async {
    var data =
    await db.collection("PLACE").where("PLACE_NAME", isEqualTo: place).get();
    if (data.docs.isNotEmpty) {
      // print("ndfjsdbf$checkNumber");
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkCategoryExist(String name) async {
    var data =
    await db.collection("CATEGORIES").where("CATEGORY_NAME", isEqualTo: name).get();
    if (data.docs.isNotEmpty) {
     // print("ndfjsdbf$checkNumber");
      return true;
    } else {
      return false;
    }
  }
  Future<bool> checklicenceExist(String phone) async {
    var data =
    await db.collection("SHOPS").where("Licence Id", isEqualTo: phone).get();
    if (data.docs.isNotEmpty) {
      // print("ndfjsdbf$checkNumber");
      return true;
    } else {
      return false;
    }
  }


 Future<void> uploadcatergory(BuildContext context) async {
   String id = DateTime
       .now()
       .millisecondsSinceEpoch
       .toString();
   HashMap<String, Object> categorymap = HashMap();

   categorymap["CATEGORY_NAME"] = addcategory.text;
   categorymap["CATEGORY_ID"] = id;
   bool categorycheck;
   categorycheck = await checkCategoryExist( addcategory.text);
     // db.collection("USERS").doc(id).set(categorymap);

     if (categoryfileimg != null) {
       String photoId = DateTime
           .now()
           .millisecondsSinceEpoch
           .toString();
       ref = FirebaseStorage.instance.ref().child(photoId);
       await ref.putFile(categoryfileimg!).whenComplete(() async {
         await ref.getDownloadURL().then((value) {
           categorymap["PHOTO"] = value;
           notifyListeners();
         });
         notifyListeners();
       });
       notifyListeners();
     } else {
       categorymap['PHOTO'] = categoryimg;
       // editMap['IMAGE_URL'] = imageUrl;
     }
   if (!categorycheck) {

     db.collection("CATEGORIES").doc(id).set(categorymap);
   }
   else{
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
         backgroundColor: Colors.red,
         content: Center(
             child: Text(
               "Category Already Exists",
               style: TextStyle(fontWeight: FontWeight.w700),
             ),
             ),
         ));
   }
   getcategoy();
   notifyListeners();
   print("upload Successfully");
 }


  Future<void> uploadPlace(BuildContext context) async {
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> placemap = HashMap();

    placemap["PLACE_NAME"] = address.text;
    placemap["PLACE_ID"] = id;
   bool placecheck;
    placecheck = await checkPlaceExist( address.text);
    // db.collection("PLACE").doc(id).set(placemap);


if (!placecheck) {

      db.collection("PLACE").doc(id).set(placemap);
     }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Center(
          child: Text(
            "Place Already Exists",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ));
    }
    getPlace();
    notifyListeners();
    print("upload Successfully");
  }


  void setImage(File image) {
    categoryfileimg = image;
    notifyListeners();
  }


  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  File? prooffileimg;
  String proofimg  ="";
  void setImageproof(File image) {
    prooffileimg = image;
    notifyListeners();
  }

  Future getImagecameraProof() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImageproof(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryProof() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImageproof(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  File? receiptfileimg;
  String receiptimg  ="";
  void setImagereceipt(File image) {
    receiptfileimg = image;
    notifyListeners();
  }

  Future getImagecameraReceipt() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImagereceipt(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryReceipt() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagereceipt(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }





  File? licencefileimg;
  String licenceimg  ="";
  void setImagelicence(File image) {
    licencefileimg = image;
    notifyListeners();
  }

  Future getImagecameraLicence() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setImagelicence(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }
  Future getImagegalleryLicence() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setImagelicence(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }


  void categoryclear(){
    addcategory.clear();
    categoryfileimg=null;
    categoryimg="";
 }
  List<Placemodel> Placelist=[];
  void getPlace(){
    db.collection("PLACE").get().then((value) {
      if (value.docs.isNotEmpty) {
        Placelist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          Placelist.add(Placemodel(
              map["PLACE_ID"].toString(),
              map["PLACE_NAME"].toString(),
             // map["PHOTO"].toString()
              ));

        }
       // filtercategorylist=categorylist;
        notifyListeners();

      }
      notifyListeners();
    });
  }
void clearitem(){
  imageFileList =[];
  itemNm.clear();
  price.clear();
  addcategory.clear();
  description.clear();
  quantity.clear();
  offers.clear();
  color.clear();
  brand.clear();
  diamention.clear();
  requirements.clear();
  productcare.clear();
  instruction.clear();
}

  List<Categorymodel> categorylist=[];
  void getcategoy(){
    db.collection("CATEGORIES").get().then((value) {
      if (value.docs.isNotEmpty) {
        categorylist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          categorylist.add(Categorymodel(
              map["CATEGORY_ID"].toString(),
               map["CATEGORY_NAME"].toString(),
              map["PHOTO"].toString()));

        }
        filtercategorylist=categorylist;
        notifyListeners();

      }
      notifyListeners();
    });
  }


  List<Placemodel> placelist=[];
  void getPlace(){
    db.collection("PLACE").get().then((value) {
      if (value.docs.isNotEmpty) {
        placelist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          placelist.add(Placemodel(
              map["PLACE_ID"].toString(),
              map["PLACE_NAME"].toString(),));


        }
       // filtercategorylist=categorylist;
        notifyListeners();

      }
      notifyListeners();
    });
  }
  void ShopLogin(String licenceid,String psword){
    db.collection("SHOPS").where("Licence Id" ,isEqualTo: licenceid)
        .where("Password" ,isEqualTo: psword).get().then((value) {
      if (value.docs.isNotEmpty){

      }else{

      }

    });

  }


  List<ShopModel> shoplist=[];
  void getshop(){
    db.collection("SHOPS").get().then((value) {
      if (value.docs.isNotEmpty) {
        shoplist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          shoplist.add(ShopModel(
              map["Licence Id"].toString(),
              map["Shop_Name"].toString(),
              map["Owner Name"].toString(),
              map["Phone No"].toString(),
              map["Email"].toString(),
              map["Place"].toString(),
              map["proof"].toString(),
              map["licence"].toString(),
              map["receipt"].toString(),
            map["Shop_ID"].toString()
          ));
          filtershoplist=shoplist;


              }
        filtershoplist=shoplist;
          notifyListeners();


      }
      notifyListeners();
    });
  }
  void getshopPending(){
    db.collection("SHOPS").where("Status", isEqualTo: "Pending").get().then((value) {
      if (value.docs.isNotEmpty) {
        shoplist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          shoplist.add(ShopModel(
              map["Licence Id"].toString(),
              map["Shop_Name"].toString(),
              map["Owner Name"].toString(),
              map["Phone No"].toString(),
              map["Email"].toString(),
              map["Place"].toString(),
              map["proof"].toString(),
              map["licence"].toString(),
              map["receipt"].toString(),
            map["Shop_ID"].toString()
          ));


              }
        filtershoplist=shoplist;
          notifyListeners();


      }
      notifyListeners();
    });
  }
  void getshopAccept(){
    db.collection("SHOPS").where("Status", isEqualTo: "ACCEPTED").get().then((value) {
      if (value.docs.isNotEmpty) {
        shoplist.clear();
        for (var element in value.docs) {
          Map<dynamic, dynamic> map = element.data();
          shoplist.add(ShopModel(
              map["Licence Id"].toString(),
              map["Shop_Name"].toString(),
              map["Owner Name"].toString(),
              map["Phone No"].toString(),
              map["Email"].toString(),
              map["Place"].toString(),
              map["proof"].toString(),
              map["licence"].toString(),
              map["receipt"].toString(),
            map["Shop_ID"].toString()
          ));


              }
        filtershoplist=shoplist;
          notifyListeners();


      }
      notifyListeners();
    });
  }






  void Shopupload(BuildContext context) async{
    String id = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    HashMap<String, Object> shopmap = HashMap();

    shopmap["Licence Id"] = licenceid.text;
    shopmap["Password"] = passwordCtrl.text;
    shopmap["Owner Name"] = owname.text;
    shopmap["Phone No"] = phnu.text;
    shopmap["Email"] = email.text;
    shopmap["Place"] = address.text;
    shopmap["Shop_Name"] = shopname.text;
    shopmap["Shop_Details"] = shopdetails.text;
    shopmap["Shop_ID"] = id;
    shopmap["Status"] = "Pending";
    bool licencecheck;
    licencecheck = await checklicenceExist( addcategory.text);
    if (!licencecheck) {

      db.collection("SHOPS").doc(id).set(shopmap);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Center(
          child: Text(
            "Licence Id Already Exists",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ));
    }

    if (licencefileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(licencefileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["licence"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['licence'] = licenceimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }

    if (prooffileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(prooffileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["proof"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['proof'] = proofimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (receiptfileimg != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(receiptfileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          shopmap["receipt"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      shopmap['receipt'] = receiptimg;
      // editMap['IMAGE_URL'] = imageUrl;
    }



    db.collection("SHOPS").doc(id.toString()).set(shopmap);
    notifyListeners();
    print("Upload Succesfully");
  }

  String _pdfDownloadURL = '';

  // Getter for PDF download URL
  String get pdfDownloadURL => _pdfDownloadURL;

  // Method to set PDF download URL
  void setPdfDownloadURL(String url) {
    _pdfDownloadURL = url;
    notifyListeners(); // Notify listeners that the state has changed
  }
  File? _imageFile;

  File? get imageFile => _imageFile;

  void setImageFile(File ?file) {
    _imageFile = file;
    notifyListeners();
  }

  List <ItemModel> filteritem = [];



  List<Categorymodel> filtercategorylist=[];
  void searchProducts(){


  }

  void searchCategory(item) {
    filtercategorylist = categorylist.where(
            (a) => a.name.toLowerCase().contains(item.toLowerCase())).toList();
    print("gdvsg"+filtercategorylist.length.toString());

    notifyListeners();
  }
  List<ShopModel> filtershoplist=[];


  void searchShop(item) {
    filtershoplist = shoplist.where(
            (a) => a.shopname.toLowerCase().contains(item.toLowerCase())).toList();
    print("gdvsg"+filtershoplist.length.toString());

    notifyListeners();
  }

  List<ItemModel> Productmodeldata = [];
  List<ItemModel> filterProductmodeldata=[];

  void getProductfilterdata() {
    db.collection("ITEMS").get().then((value) {
      Productmodeldata.clear();
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          Map<dynamic, dynamic> prdctmap = element.data();
          Productmodeldata.add(ItemModel(
              prdctmap["Item Id"].toString(),
              prdctmap["PHOTO"].toString(),
              prdctmap["Item Name"].toString(),
              prdctmap["Price"].toString(),
              prdctmap["Category"].toString(),
              prdctmap["Category_id"].toString(),
              prdctmap["description"].toString(),
              prdctmap["Item Quantity"].toString(),
              prdctmap["Offers"].toString(),
              prdctmap["color"].toString(),
              prdctmap["Brand"].toString(),
              prdctmap["Product Dimensions"].toString(),
              prdctmap["Assembly Required"].toString(),
              prdctmap["Product Care"].toString(),
              prdctmap["Instructions"].toString(),
            prdctmap["Place"].toString(),
          ));
          filterProductmodeldata = Productmodeldata;
          notifyListeners();
        }
      }
    });
  }

  void searchProduct(item) {
    filterProductmodeldata = Productmodeldata.where(
            (a) => a.itemname.toLowerCase().contains(item.toLowerCase())).toList();
    notifyListeners();
  }

  void statusDecln(String id) {
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Status"] = "DECLINED";
    db.collection("SHOPS").doc(id).set(dataMap, SetOptions(merge:true));
  }

  void statusApprove(String id) {
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Status"] = "ACCEPTED";
    db.collection("SHOPS").doc(id).set(dataMap, SetOptions(merge:true));
  }
  void statusblocked(String id) {
    Map<String, dynamic> dataMap = HashMap();
    dataMap["Status"] = "BLOCKED";
    db.collection("SHOPS").doc(id).set(dataMap, SetOptions(merge:true));
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    print(position.longitude);
  }


}

