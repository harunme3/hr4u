import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/constant/constants.dart';
import 'package:hr4u/newpages/uploaddocument/uploaddocument.dart';
import 'package:http/http.dart' as http;
import '../components/color.dart';
import 'employee_document_list.dart';

class employee_details extends StatefulWidget {
  final int? id;

  const employee_details({super.key, required this.id});

  @override
  State<employee_details> createState() => _employee_detailsState();
}

class _employee_detailsState extends State<employee_details> {
  static const storage = FlutterSecureStorage();

  Future getUsers() async {
    var loginResponse = await storage.read(key: 'LOGIN_RESS');
    var url = ApiConstants.baseUrl + 'employees/' + widget.id.toString();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginResponse'
    };
    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    // String url =
    //     ApiConstants.baseUrl + 'employees/' + widget.id.toString();
    // final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    print(response.body);
    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: oxfordBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Employees Details',
            style: TextStyle(color: white),
          ),
        ),
        body: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            // print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final users = snapshot.data!;
                Map<String, dynamic> usersMap = users as Map<String, dynamic>;
                print(usersMap);
                return buildUsers(usersMap);
              } else {
                return Center(child: Text('no data'));
              }
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ));
  }

  Widget buildUsers(usersMap) => Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 48,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usersMap['data']['employee_name'],
                        style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        usersMap['data']['employee_number'],
                        // usersMap['employee_number'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     width: double.infinity,
          //     height: 50,
          //     decoration: BoxDecoration(
          //         color: primaryLightRed,
          //         borderRadius: BorderRadius.circular(25)),
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text(
          //             "Visa Expiry Date :",
          //             style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w600,
          //                 color: white),
          //           ),
          //           Text(
          //             "14/12/2024",
          //             style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w600,
          //                 color: white),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 203, 203, 204),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Email :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Mobile :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Adress :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "DOB :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Gender :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Nationality:",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   "Passport Expiry :",
                          //   style: TextStyle(
                          //       color: oxfordBlue,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w600),
                          // ),
                          Text(
                            " Last Login :",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Created Date:",
                            style: TextStyle(
                                color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   "Created By:",
                          //   style: TextStyle(
                          //       color: oxfordBlue,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w600),
                          // ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            usersMap['data']['email'],
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            usersMap['data']['mobile_no'].toString(),
                            // usersMap['mobile_no'].toString(),
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Flexible(
                            child: Text(
                              usersMap['data']['address'].toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  //     color: oxfordBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            usersMap['data']['d_o_b'].toString(),
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            //  usersMap['passport_no'],
                            usersMap['data']['nationality'],
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   'jo',
                          //   style: TextStyle(
                          //       //     color: oxfordBlue,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w600),
                          // ),
                          Text(
                            usersMap['data']['last_login'],
                            style: TextStyle(
                                color: primaryLightRed,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          // Text(
                          //   usersMap['data']['created_at'],
                          //   style: TextStyle(
                          //       //     color: oxfordBlue,
                          //       fontSize: 18,
                          //       fontWeight: FontWeight.w600),
                          // ),
                          Text(
                            "sandysingaperumal",
                            style: TextStyle(
                                //     color: oxfordBlue,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 253, 132, 172),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 30,
                    ),
                    Text(
                      "Attendence Report",
                      style: TextStyle(
                          color: oxfordBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 242, 121),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.calendar_month,
                      size: 30,
                    ),
                    Text(
                      "VAT Report",
                      style: TextStyle(
                          color: oxfordBlue,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadDocumentData()));
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 110, 247, 178),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                      Text(
                        "Document",
                        style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
