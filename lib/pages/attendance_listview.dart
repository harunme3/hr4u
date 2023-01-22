import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/color.dart';
import '../model/atten_modellistview.dart.dart';


class Atten_Report_page extends StatelessWidget {
  const Atten_Report_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oxfordBlue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: white,
          ),
          onPressed: () {},
        ),
        title: Center(
          child: const Text(
            'Attendance Report',
            style: TextStyle(color: white),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/icon/attenadd.png'))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: .2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search..',
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
                                padding:
                                    const EdgeInsets.only(left: 0, right: 10),
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
          ),
        ],
      ),
    );
  }
}
