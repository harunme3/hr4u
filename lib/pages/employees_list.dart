import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/constant/constants.dart';
import 'package:http/http.dart' as http;

import '../components/color.dart';
import 'employee_detailes.dart';

class Employees_List extends StatefulWidget {
  const Employees_List({Key? key}) : super(key: key);

  @override
  State<Employees_List> createState() => _Employees_ListState();
}

class _Employees_ListState extends State<Employees_List> {
  bool isUserLoading = false;
  static const storage = FlutterSecureStorage();
  Future<EmployeeListModel> usersFuture = getUsers();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersFuture = getUsers();

    setState(() {
      isUserLoading = true;
    });
  }

  static Future<EmployeeListModel> getUsers() async {
    var loginResponse = await storage.read(key: 'LOGIN_RESS');

    // if (loginResponse != null)
    // {
    //   Map resBodyMap = jsonDecode(loginResponse);
    //   desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
    //   // print(desiredMap);
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text("Sending Message $desiredMap"),
    //   ));
    // }

    var url = ApiConstants.getEmployees;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginResponse'
    };

    final response = await http.get(Uri.parse(url), headers: requestHeaders);
    final body = json.decode(response.body);
    print(body['data']);
    return EmployeeListModel.fromJson(jsonDecode(response.body));
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
            'Employees List',
            style: TextStyle(color: white),
          ),
        ),
        body: !isUserLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : FutureBuilder<EmployeeListModel>(
                future: usersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return buildUsers(users);
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

  Widget buildUsers(EmployeeListModel users) => ListView.builder(
        itemCount: users.data?.length,
        itemBuilder: (context, index) {
          print(users.data);
          var User = users.data![index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(ApiConstants.ProfileUrlImg +
                    '${users.data![index].profileUrl}'),
              ),
              title: Text('${users.data![index].employeeName}'),
              subtitle: Text('${users.data![index].employeeNumber}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => employee_details(id: User.id)));
              },
            ),
          );
        },
      );
}

class EmployeeListModel {
  String? message;
  bool? status;
  int? code;
  List<Data>? data;

  EmployeeListModel({this.message, this.status, this.code, this.data});

  EmployeeListModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? employeeName;
  String? employeeNumber;
  String? email;
  int? mobileNo;
  String? profileUrl;

  Data(
      {this.id,
      this.employeeName,
      this.employeeNumber,
      this.email,
      this.mobileNo,
      this.profileUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeName = json['employee_name'];
    employeeNumber = json['employee_number'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    profileUrl = json['profile_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_name'] = this.employeeName;
    data['employee_number'] = this.employeeNumber;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['profile_url'] = this.profileUrl;
    return data;
  }
}
