import 'dart:io';
import 'package:flutter/material.dart';
import '../components/color.dart';
import 'package:image_picker/image_picker.dart';

class upload_document extends StatefulWidget {
  const upload_document({Key? key}) : super(key: key);

  @override
  State<upload_document> createState() => _upload_documentState();
}

class _upload_documentState extends State<upload_document> {
  File? _image;
  Future getimage(ImageSource Source) async {
    final image = await ImagePicker().pickImage(source: Source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: oxfordBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: white,
            ),
            onPressed: () {},
          ),
          title: const Text(
            'Leave Approval',
            style: TextStyle(color: white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image != null
                  ? Image.file(_image!,
                      width: 350, height: 250, fit: BoxFit.cover)
                  : Image.network(
                      'https://www.pngall.com/wp-content/uploads/2/Upload-PNG-HD-Image.png',
              width: 250,height: 250,),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'You need to upload your ',
                  style: TextStyle(
                    fontSize: 20,
                    color:Colors.grey,
                    fontWeight:FontWeight.w500,
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: Text(
                    'Documents ',
                    style: TextStyle(
                      fontSize: 25,
                      color:oxfordBlue,
                      fontWeight:FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              CustomButton(
                title: 'Upload your Image',
                onCLick: () => getimage(ImageSource.gallery),
              ),
              Container(
                child: Text('or'),
              ),
              CustomButton(
                title: 'Pick from camera',
                onCLick: () => getimage(ImageSource.camera),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CustomButton({
  required String title,
  required VoidCallback onCLick,
}) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // side: BorderSide(width: 1, color: Colors.brown),
            shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20)),
        onPressed: onCLick,
        child: Text(title),
      ),
    ),
  );
}
