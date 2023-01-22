// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/constant/constants.dart';
import '../pages/addEmployees.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // add Employee
  static saveCollection(
    employeeName,
    email,
    mobileNo,
    password,
    dob,
    address,
    SelectGender,
    bloodGroup,
    nationality,
    JoinDate,
    selectedRole,
  ) async {
    const storage = FlutterSecureStorage();
    Map? desiredMap;
    var loginResponse = await storage.read(key: 'LOGIN_RESS');
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginResponse'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://hr4u.sridints.com/public/api/employees'));
    request.fields.addAll({
      'employee_name': employeeName.toString(),
      'email': email.toString(),
      'mobile_no': mobileNo.toString(),
      'password': password.toString(),
      'address': address.toString(),
      'blood_group': bloodGroup.toString(),
      'gender': SelectGender.toString(),
      'nationality': nationality.toString(),
      'd_o_b': dob.toString(),
      'd_o_joining': JoinDate.toString(),
      'role': selectedRole.toString()
    });

    if (empProfileFile != null) {
      request.files.add(
          await http.MultipartFile.fromPath('profile_url', empProfileFile));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
