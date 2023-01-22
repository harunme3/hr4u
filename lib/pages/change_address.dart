import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hr4u/components/color.dart';
import 'package:image_picker/image_picker.dart';

class change_address extends StatefulWidget {
  const change_address({super.key});

  @override
  State<change_address> createState() => _change_addressState();
}

class _change_addressState extends State<change_address> {
  File? _image;
  Future getimage(ImageSource Source) async {
    final image = await ImagePicker().pickImage(source: Source);
    if (image == null) return;
    //  final imageTemporary = File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: oxfordBlue),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Change Address",
              style: TextStyle(color: oxfordBlue, fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Upload a Proof',
              onCLick: () => getimage(ImageSource.gallery),
            ),
            SizedBox(
              height: 350,
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    primary: oxfordBlue,
                    elevation: 8,
                    shadowColor: Colors.black87,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Verify Now",
                    style: TextStyle(fontSize: 19),
                  )),
            )
          ],
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
            backgroundColor: primaryGrey,
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
