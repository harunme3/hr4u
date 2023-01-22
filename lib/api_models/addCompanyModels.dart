import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constant/constants.dart';
import '../service/apiMethod.dart';

class CompayModels {
  static savacompany(companyName, companyEmail, companyMobile, companyAddress,
      companyCity, companyZipcode) async {
    // const storage = FlutterSecureStorage();
    // Map? desiredMap;
    late var response;

    // var compayadd = await storage.read(key: 'LOGIN_RES');
    // if (compayadd != null) {
    //   Map resBodyMap = jsonDecode(compayadd);
    //   desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
    //   print(desiredMap);
    // }

    Map<String, String> body = {
      "company_name": companyName,
      "company_email": companyEmail,
      "company_mobile": companyMobile,
      "company_address": companyAddress,
      "company_address": companyCity,
      "company_zipcode": companyZipcode,
    };

    String jsonResponse;
    var url = ApiConstants.addCompany;
    response = await ApiMethods.post(url, body);

    if (response.statusCode == 200) {
      jsonResponse = response.body.toString();
      Map notificationResult = jsonDecode(jsonResponse.toString());
      return response = notificationResult;
    }

    else if (response.statusCode == 400) {
      jsonResponse = response.body.toString();
      throw Exception("Error while fetching. \n ${response.body}");
    }

    else {
      throw Exception("Error while fetching. \n ${response.body}");
    }

  }
}
