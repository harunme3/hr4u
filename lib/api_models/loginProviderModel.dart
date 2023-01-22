// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/constant/constants.dart';
import 'package:hr4u/model/auth/login_reponse_model.dart';
import 'package:hr4u/utils.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper_string.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../pages/dashboard_state.dart';
import '../pages/dashboardsEmployee.dart';

class LoginProviderModel with ChangeNotifier {
  final _storage = const FlutterSecureStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    setLoading(true);
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(Uri.parse(ApiConstants.adminSignin),
          body: ({
            'email': emailController.text,
            'password': passwordController.text,
          }));
      if (response.statusCode == 200) {
        String resBody = response.body.toString();

        Map resBodyMap = jsonDecode(resBody);

        Logger().w(resBodyMap);
        int id = resBodyMap['user']['id'];
        Logger().w(id);

        if (resBodyMap['data'] != "") {
          LoginResponseData loginResponseData =
              loginResponseDataFromJson(response.body);
          await _storage.write(key: 'LOGIN_RES', value: jsonEncode(resBodyMap));
          await _storage.write(
              key: 'LOGIN_RESS', value: resBodyMap['data']['token'].toString());
          await StorageHelper.instance.setString(
              StorageHelperString.loginUserData,
              json.encode(loginResponseData.toJson()));
          await StorageHelper.instance.setInt(StorageHelperString.loginUserType,
              loginResponseData.user?.role ?? 3);
          await StorageHelper.instance
              .setBool(StorageHelperString.isUserLoggedIn, true);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  id == 1 ? const DashboardStats() : const Dashboards(),
            ),
            (route) => false,
          );
        } else {
          Utils.showSnackBar(context, resBodyMap['message'].toString());
          Utils.showSnackBar(context, 'Invalid');
        }
        setLoading(false);
      } else {
        String resBody = response.body.toString();

        Map resBodyMap = jsonDecode(resBody);

        setLoading(false);
        Utils.showTopSnackBar(resBodyMap["messages"]);
      }
    }
  }
}

//
//
// var request = http.MultipartRequest('POST', Uri.parse('http://hr4u.sridints.com/public/api/signin'));
// request.fields.addAll({
// 'email':emailController.text,
// 'password': passwordController.text
// });
//
//
// http.StreamedResponse response = await request.send();
//
// if (response.statusCode == 200) {
// print(await response.stream.bytesToString());
// //print(json.decode(utf8.decode(response)) );
// //  String resBody = response.stream.toString();
// //    Map resBodyMap = jsonDecode(resBody);
// //    if (resBodyMap['status'] == true) {
// //
// //      await _storage.write(key: 'LOGIN_RES', value: jsonEncode(resBodyMap));
// //      // await _storage.write(key: 'LOGIN_RESS', value: jsonEncode(response.));
// //      Utils.showSnackBar(context, resBodyMap['message'].toString());
// //      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardStats()));
//
// }
// // else
// //   {
// //     print('joseph');
// //     // Utils.showSnackBar(context, resBodyMap['message'].toString());
// //   }
// setLoading(false);
// }
// else {
// setLoading(false);
// print('vicky');
// //Utils.showSnackBar(context, 'Invalid');
// }
