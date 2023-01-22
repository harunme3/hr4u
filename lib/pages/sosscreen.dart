import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../components/color.dart';
import '../model/sos_listview.dart';
import 'Notification/SOSNotofication/ViewSosNotification.dart';

class SosScreen_page extends StatefulWidget {
  const SosScreen_page({Key? key}) : super(key: key);

  @override
  State<SosScreen_page> createState() => _SosScreen_pageState();
}

class _SosScreen_pageState extends State<SosScreen_page> {
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
            'SOS',
            style: TextStyle(color: white),
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('assets/icon/sos.png'))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: SosData.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: absendicol,
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/icon/alert.png',
                                  height: 40,
                                ),
                                flex: 2,
                              ),
                              Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      SosData[index].vatdel,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: oxfordBlue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      SosData[index].name,
                                      style: TextStyle(
                                        color: oxfordBlue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: Text(
                                              SosData[index].date,
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Text(
                                              SosData[index].time,
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Icon(
                                    //   Icons.arrow_forward_ios_sharp,
                                    // ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: oxfordBlue,
                                      ),
                                      onPressed: () {
                                        //                     Navigator.push(
                                        // context,
                                        // MaterialPageRoute(
                                        //     builder: (context) => ResetPasswordScreen()));
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SosViewNotification()));
                                      },
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
