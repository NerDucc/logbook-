// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/logbook/route_name.dart';
import 'package:image_picker/image_picker.dart';

class MyImage extends StatefulWidget {
  const MyImage({super.key});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {


  File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async{
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: Text("Home"),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text("Images "),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.pushNamed(context, RouteNames.Welcome);
              
            } else if (value == 1) {
              Navigator.pushNamed(context, RouteNames.MyImage);
            }
          })
        ],
      ),
      body: Center(
        child: _image == null ? const Text("No image selected") : Image.file(_image!),
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

}