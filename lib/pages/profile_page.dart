import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../components/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _storage = const FlutterSecureStorage();
  Map? desiredMap;

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  loginCheck() async {
    var loginResponse = await _storage.read(key: 'LOGIN_RES');
    if (loginResponse != null) {
      Map resBodyMap = jsonDecode(loginResponse);
      desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
      setState(() {
        desiredMap = desiredMap;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Container(
        //   width: 40,
        //   child: Image.network(''),
        // ),
        backgroundColor: primaryDarkIndigo,
        elevation: 0,
        title: const Text('Profile'),
        centerTitle: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                desiredMap != null ? desiredMap!['data']['name'] : '',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Email Address : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                desiredMap != null ? desiredMap!['data']['email'] : '',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              TextButton(onPressed: (){}, child: Text(
                                'verfiy',
                                style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                              ))
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Gender : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Borth : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                '15/08/2000 ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Passport Number : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                                ),
                            ),
                            child: Row(children: [
                              Text(
                                'P4767326572 ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ],
                            ),
                        ),
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Passport Expiry : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                '27/10/2030',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Address : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                'TVM , Sankai , Pudhur, 606602',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Visa Expiry : ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ))),
                            child: Row(children: [
                              Text(
                                '15/02/2030',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Icon(
                              //   Icons.keyboard_arrow_right,
                              //   color: Colors.grey,
                              //   size: 40.0,
                              // )
                            ]))
                      ],
                    ),
                  )),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: oxfordBlue,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
