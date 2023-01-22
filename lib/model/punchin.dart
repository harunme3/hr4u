import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/color.dart';
import 'atten_modellistview.dart.dart';


class punchin extends StatelessWidget {
  const punchin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: AttenData.length,
        itemBuilder: (context, index) => new Column(
          children: <Widget>[
            new Divider(
              height: 5,
              color: oxfordBlue,
            ),
            new ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 209, 218, 252),
                backgroundImage: AssetImage(AttenData[index].pics),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AttenData[index].date,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: oxfordBlue,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 10),
                          child: Text(
                            "Punch OUT : " + AttenData[index].punchin,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: Text(
                            "PunchIN: " + AttenData[index].punchin,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
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
