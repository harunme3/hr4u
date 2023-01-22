import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../components/color.dart';
import '../../model/atten_modellistview.dart.dart';
import 'LeaveModels.dart';



class MyLeave extends StatelessWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Leavedata.length,
        itemBuilder: (context, index) => new Column(
          children: <Widget>[
            new Divider(
              height: 5,
              color: oxfordBlue,
            ),
            new ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Leavedata[index].date,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Leavedata[index].Reason,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
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
