// import 'dart:convert';
// import 'package:hr4u/service/apiMethod.dart';
// import 'package:http/http.dart' as http;
//
// import '../constant/constants.dart';
//
// class ApiServices {
//   static adminlogin( String email , String password) async{
//     late var response;
//    Map<String,String> body ={
//      'email' : email,
//      'password' : password
//    };
//  String AdminLoginresponse;
//  String url = ApiConstants.baseUrl + ApiConstants.adminlogin;
//  response = await ApiMethods.post(url, body);
//  print("response");
//  print(response);
//     if (response.statusCode == 200) {
//       AdminLoginresponse = response.body.toString();
//       print("AdminLoginresponse");
//       print(AdminLoginresponse);
//       Map appLoginResult = jsonDecode(AdminLoginresponse.toString());
//       print("appLoginResult");
//       print(appLoginResult);
//       if (appLoginResult['code'] == 400) {
//         AdminLoginresponse = response.body.toString();
//         // throw Exception("Error while fetching. \n ${response.body}");
//       }
//       if(appLoginResult['data'] != null){
//         response = appLoginResult['data'];
//       } else {
//         response = appLoginResult;
//       }
//
//     }
//     return response;
//   }
//
//
// }
