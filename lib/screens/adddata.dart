import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // Your code here
  final TextEditingController _diseaseNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<Uint8List> _images = [];
  final ImagePicker _picker = ImagePicker();
  List<String> _imageUrls = []; // to store download URLs of uploaded images

  CollectionReference diseases = FirebaseFirestore.instance.collection('diseases');

  Future<void> _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image!= null) {
      _images.add(await image.readAsBytes());
      setState(() {});
    }
  }

  Future<void> _uploadImages() async {
    try {
      for (var imageBytes in _images) {
        // Generate a unique filename for each image (you may use UUID or any other unique identifier)
        String filename = DateTime.now().millisecondsSinceEpoch.toString();

        // Upload image to Firebase Storage
        await firebase_storage.FirebaseStorage.instance
           .ref('diseases/$filename.jpg')
           .putData(imageBytes);

        // Get the download URL of the uploaded image
        String downloadURL = await firebase_storage.FirebaseStorage.instance
           .ref('diseases/$filename.jpg')
           .getDownloadURL();

        // Save the download URL to the list
        _imageUrls.add(downloadURL);
      }
    } catch (e) {
      print('Error uploading images: $e');
      // Handle error, show a snackbar or toast, etc.
    }
  }

  Future<void> _addDisease() async {
    await _uploadImages();
    diseases.add({
      'diseaseName': _diseaseNameController.text,
      'description': _descriptionController.text,
      'imageUrls': _imageUrls,
    });
    Navigator.pop(context); // Navigate back
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Disease'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [            TextField(
              controller: _diseaseNameController,
              decoration: InputDecoration(
                labelText: 'Disease Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            _images.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _selectImage,
                      child: Text('Select Image'),
                    ),
                  )
                : Image.memory(_images[0]),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _uploadImages();
                FirebaseFirestore.instance.collection('diseases').add({
                  'diseaseName': _diseaseNameController.text,
                  'description': _descriptionController.text,
                  'imageUrl': _imageUrls[0],
                }).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Disease added successfully')),
                  );
                  Navigator.pop(context);
                });
              },
              child: Text('Add Disease'),
            ),
          ],
        )


        ),
      );
  }
}