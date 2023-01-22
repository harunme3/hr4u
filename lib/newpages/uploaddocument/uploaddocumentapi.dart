// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class UploadDocumentAPI {
  static var l = Logger();
  static Future<dynamic> uploaddocumnets({
    required String doc_name,
    required String doc_number,
    required String doc_downloadable,
    required String doc_emp_id,
    required String doc_begin_date,
    required String doc_expiry,
    required String doc_type,
    required String doc_url,
  }) async {
    String baseurl = "http://hr4u.sridints.com/public/api/documents/1";

    Dio dio = Dio();
    const storage = FlutterSecureStorage();
    var loginResponse = await storage.read(key: 'LOGIN_RESS');
    // var token =
    //     "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5ODMwZDQ2Yy1jMzRmLTQ3ZTAtODlmZC03NDI2ZGVkYjA4YjMiLCJqdGkiOiIyMzcyNmQxYmZmYzk0YjUwYTg3ZjAwOWRhMGExOWVkZjIzYWZjZGYxMTk2OWJjZmIwY2IyNzdjMzkxY2I3MTgzYjAyYWQxZWU1NWIwZWI2MSIsImlhdCI6MTY3NDM2MzQ5Ni41NDUyNjA5MDYyMTk0ODI0MjE4NzUsIm5iZiI6MTY3NDM2MzQ5Ni41NDUyNjMwNTE5ODY2OTQzMzU5Mzc1LCJleHAiOjE3MDU4OTk0OTYuNTQzNTk2OTgyOTU1OTMyNjE3MTg3NSwic3ViIjoiMSIsInNjb3BlcyI6W119.fAN6IZJY97kAAKo2MhTM5tuhTiroL537q1Turd5NvVINbpUYJJ4xfV01syNsRANrUFwkqfHFttlIpXZmzf1ZCdsAEBuI4pazKDG5v3OZOqe6cK0HI5trts8-PmUqELYyDJ7mE4rcNbslhFsEwqWMuNrto-6Fmvd2NNqC1j8mSKNRp-jAAFs1UuTzTMhtF0YBUSoVNvRTO9vaAPhDOjdsSMlyySXPSSFPFxRK0-d2p7lI6M_cqPk4XQqt_IQTT3vCCgq1b7NKkooJzFWDDwe0OKQo6DkbYuCAuuAnljzdVJUlj_0DFiQphZ070U-NAUW-QXyMPkQFXBaePWBBx2irgny3uDdf7QQriCD2JEuaisyVi1RxRTXW-9C3d9bxBJQ5O0GMIVw7sTStMUa1C7w5BKpiZq6Gah1F-Fh8IyO1AcP9wI6x32dwq0icn1RkFqUlz4Vp38CowiU1gfRdyfTsCHeld0ARxWjI-IJfZLsEzHHewJMGckj1NWoep5NPE_264VFrm8JgsIRIf4kFCKclb4oW5Qst_KAh1RgfnZ73B_qZeSu8_1a0r0p0ezZXVFUAI2V9_6kSIHELzKt4_5T6HbSImi2p9sq1kNN9qBOn1R1D7UVoc6S642LRbVtHD3Lc363luFjTcabok6VTIxVsUk1fh1rnIVPOcp-HrzzGqxg";
    var token = "Bearer $loginResponse";
    l.d(token);
    var formData = FormData.fromMap({
      "doc_name": doc_name,
      "doc_number": doc_number,
      "doc_downloadable": doc_downloadable,
      "doc_emp_id": doc_emp_id,
      "doc_begin_date": doc_begin_date,
      "doc_expiry": doc_expiry,
      "doc_type": doc_type,
      "doc_url": [
        await MultipartFile.fromFile(doc_url),
      ]
    });
    l.wtf(formData.fields);

    try {
      var response = await dio.post(
        baseurl,
        data: formData,
        options: Options(
          followRedirects: false,
          headers: {
            'Accept': "application/json",
            'Content-type': 'multipart/form-data',
            "Authorization": token,
          },
        ),
      );
      l.w(response);
      if (response.statusCode == 200) {
        l.w(response.data);
        return response.data;
      } else {
        return {"status": false, "msg": "Server error try again"};
      }
    } on Exception catch (e) {
      l.e(e);
      return {"status": false, "msg": e};
    }
  }
}
