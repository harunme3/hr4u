// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TKShowImg extends StatelessWidget {
  const TKShowImg({
    Key? key,
    required this.width,
    required this.imgpath,
    required this.horizontal,
    required this.vertical,
    required this.ontap,
  }) : super(key: key);
  final double width;
  final String imgpath;
  final double horizontal;
  final double vertical;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: width * 0.20,
              width: width * 0.20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.file(
                    File(imgpath),
                    fit: BoxFit.contain,
                    height: width * 0.20,
                    width: width * 0.20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
