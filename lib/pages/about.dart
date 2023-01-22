import 'package:flutter/material.dart';

import '../components/help_component.dart';
import 'package:hr4u/components/color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: oxfordBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: ()=> Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.arrow_back_ios, color: white),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "About App",
                    style: TextStyle(
                        color: white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Center(
                    child:
                        ImageWrapper(image: "assets/images/logo.png", wid: 4),
                  ),
                  Center(
                    child: Text(
                      "HR Solutions",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "A Complete HR Solutions for your \n                      Enterprise.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Text(
                            "Version 1.0.1 YSTB2W002",
                            style: TextStyle(color: oxfordBlue, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Text('Renewable Energy Company',style: TextStyle(color:Colors.grey,fontSize: 22,)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('©2023 Copyright HR4U™. All right reserved.', style: TextStyle(color:btnBlue,fontSize: 18,))
                      ],
                    ),
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
