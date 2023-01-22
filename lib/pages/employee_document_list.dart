import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../components/color.dart';
import '../constant/constants.dart';

class employee_document_list extends StatefulWidget {
  // final int? id;
  final Map<String, dynamic> usersMap;
  const employee_document_list({super.key, required this.usersMap});

  @override
  State<employee_document_list> createState() => _employee_document_listState();
}

class _employee_document_listState extends State<employee_document_list> {
  // final _storage = const FlutterSecureStorage();
  // Map? widget.usersMap;
  // bool loading = false;
  @override
  void initState() {
    super.initState();
    // loginCheck();
    print(widget.usersMap['visa_doc'].toString().split(".").last);
  }

  // loginCheck() async {
  //   // var loginResponse = await _storage.read(key: 'LOGIN_RES');
  //   // if (loginResponse != null) {
  //   //   Map resBodyMap = jsonDecode(loginResponse);
  //   //   widget.usersMap = resBodyMap.map((key, value) => MapEntry(key, value));
  //   //   setState(() {
  //   //     widget.usersMap = widget.usersMap;
  //   //   });
  //   // }
  //   String url =
  //       await ApiConstants.baseUrl + 'employee/' + widget.id.toString() + '/show';
  //   final response = await http.get(Uri.parse(url));
  //   // final body = json.decode(response.body);
  //   Map resBodyMap = jsonDecode(response.body);
  //     widget.usersMap = resBodyMap.map((key, value) => MapEntry(key, value));
  //     setState(() {
  //       widget.usersMap = widget.usersMap;
  //     });
  // }
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
          'Documents',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Passport Document',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            (widget.usersMap['passport_doc'].toString().split(".").last ==
                        'png' ||
                    widget.usersMap['passport_doc']
                            .toString()
                            .split(".")
                            .last ==
                        'jpeg' ||
                    widget.usersMap['passport_doc']
                            .toString()
                            .split(".")
                            .last ==
                        'jpg')
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(ApiConstants.baseUrlImg +
                            widget.usersMap['passport_doc'].toString()),
                      ),
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: oxfordBlue,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      onPressed: () async {
                        await launchUrl(Uri.parse(ApiConstants.baseUrlImg +
                            widget.usersMap['passport_doc'].toString()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "View Document",
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'VISA Document',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            (widget.usersMap['visa_doc'].toString().split(".").last == 'png' ||
                    widget.usersMap['visa_doc'].toString().split(".").last ==
                        'jpeg' ||
                    widget.usersMap['visa_doc'].toString().split(".").last ==
                        'jpg')
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(ApiConstants.baseUrlImg +
                            widget.usersMap['visa_doc'].toString()),
                      ),
                    ),
                  )
                : Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: oxfordBlue,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                      onPressed: () async {
                        await launchUrl(Uri.parse(ApiConstants.baseUrlImg +
                            widget.usersMap['visa_doc'].toString()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "View Document",
                          style: TextStyle(
                            fontSize: 22,
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
