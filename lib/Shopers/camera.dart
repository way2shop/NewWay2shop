import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:a/providers/MainProvider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:a/widgets/HomeButton.dart';

import '../widgets/Costfield.dart';

class camera extends StatelessWidget {
  const camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context, listen: false);

    // Function to handle image upload
    Future<void> _handleImageUpload() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowCompression: true,
      );

      if (result != null) {
        if (result.files.isNotEmpty) {
          File file = File(result.files.single.path!);
          // Update the selected image file in the provider
          mainProvider.setImageFile(file);
        } else {
          // Handle the case where the file list is empty
          print('No file selected');
        }
      } else {
        // Handle the case where the user cancels the file picker
        print('User canceled the file picker');
      }
    }

    // Function to upload image to Firebase Storage
    Future<void> _uploadImageToFirebase(File file) async {
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg'; // Generate a unique file name
        Reference ref = storage.ref().child('images').child(fileName); // Set the path where the file will be stored in Firebase Storage
        await ref.putFile(file);
        String downloadUrl = await ref.getDownloadURL();
        print('File uploaded to Firebase Storage: $downloadUrl');
        // Do something with the downloadUrl if needed
      } catch (e) {
        print('Error uploading file to Firebase Storage: $e');
      }
    }

    // Function to open browser for uploading
    void _openBrowserForUpload() async {
      const url = 'https://example.com/upload'; // Your upload URL
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    // Function to remove the uploaded image
    void _removeImage(MainProvider mainProvider) {
      mainProvider.setImageFile(null);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF650015),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xff650015)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF650015)),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              if (value.imageFile != null)
                                Image.file(value.imageFile!, width: double.infinity, height: double.infinity, fit: BoxFit.cover)
                              else
                                InkWell(
                                  onTap: _handleImageUpload,
                                  child: Icon(Icons.add_a_photo_outlined, color: Colors.grey, size: 40),
                                ),
                              if (value.imageFile != null)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    icon: Icon(Icons.remove_circle, color: Colors.red),
                                    onPressed: () => _removeImage(mainProvider),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _openBrowserForUpload,
                          child: Text("Upload Image"),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            SizedBox(height: 20,),
                            Costfield(ItemController: value.itemNm,width: 296, hight: 50, hintText: "Item Name"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.itemCd,width:296 , hight: 50, hintText: "Item Code"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.price,width:296 , hight: 50, hintText: "Price"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.color,width:296 , hight: 50, hintText: "color"),
                            SizedBox(height: 10,),
                            Costfield(ItemController: value.description,width:296 , hight: 50, hintText: "description"),
                            SizedBox(height: 10,),

                            Costfield(ItemController: value.quantity,width:296 , hight: 50, hintText: "Item Quantity"),
                            SizedBox(height: 10,),

                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                          child: MaterialButton(
                            onPressed: () async {
                              if (mainProvider.imageFile != null) {
                                await _uploadImageToFirebase(mainProvider.imageFile!);
                                // Perform submission or any other action after uploading to Firebase
                              } else {
                                // Show an error message or handle accordingly if no image is selected
                              }
                            },
                            child: const Text("Submit"),
                            highlightColor: Color(0xff0C630A),
                            splashColor: Colors.grey,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}