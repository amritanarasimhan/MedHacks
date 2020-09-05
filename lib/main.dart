//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';




void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  }
}

//creates icons
class MyAppState extends State<MyApp>{
  File imageFile;
  PickedFile image;
  final picker = ImagePicker();
  //tells whether or not we shoud access camera
  Future getImage(bool isCamera) async {

    //captures a picture from camera and stores it inside image
    if(isCamera){
      image = await picker.getImage(source: ImageSource.camera);
      imageFile = File(image.path);
    }
    else{
      image = await picker.getImage(source: ImageSource.gallery);
      imageFile = File(image.path);
    }
    setState(() {
      image = image;
    });
  }
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AlereMe')
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.insert_drive_file),
                onPressed: () {
                  getImage(false); //no we want gallery
                },
              ),
              SizedBox(height: 10.0,),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  getImage(true); //yes we want camera
                },
              ),

            image == null? Container(): Image.file(imageFile, height: 300, width: 300,)//if there is no image display an empty container, otherwise display image
            ]
          )

      )
      )

    );
  }
}

