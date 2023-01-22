import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TKUpload extends StatelessWidget {
  const TKUpload(
      {Key? key,
      required this.width,
      required this.name,
      required this.horizontal,
      required this.vertical,
      required this.ontap,
      required this.msg})
      : super(key: key);
  final double width;
  final String name;
  final double horizontal;
  final double vertical;
  final String msg;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            height: width * 0.65,
            width: width * 0.75,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.red,
                  height: width * 0.20,
                  width: width * 0.20,
                ),
                Text(
                  msg,
                  style: Theme.of(context).textTheme.headline6!.copyWith(),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: ontap,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontal, vertical: vertical),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            width: 1.5,
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Text(
                          'Choose File',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.white),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Text('No File Choosen',
                        style: Theme.of(context).textTheme.headline4!),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('(size should be 250kb)',
                style: Theme.of(context).textTheme.headline4!),
          ),
        ],
      ),
    );
  }
}
