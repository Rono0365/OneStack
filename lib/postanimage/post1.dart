import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ImagePickerScreen());
}

class ImagePickerScreen extends StatefulWidget {
  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  String imageBase64 = '';
  File? image;

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }

    image = File(pickedImage.path);
    final List<int> imageBytes = await image!.readAsBytes();
    imageBase64 = base64Encode(imageBytes);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pick Image'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (image != null)
                Image.file(
                  image!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ElevatedButton(
                onPressed: pickImage,
                child: Text('Pick an Image'),
              ),
              Text('Image Base64: $imageBase64'),
            ],
          ),
        ),
      ),
    );
  }
}