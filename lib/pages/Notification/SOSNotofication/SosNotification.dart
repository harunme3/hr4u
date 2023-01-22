import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/pages/Notification/SOSNotofication/ViewSosNotification.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../components/color.dart';
import '../../../constant/constants.dart';

class SosNotification extends StatefulWidget {
  const SosNotification({Key? key}) : super(key: key);

  @override
  State<SosNotification> createState() => _SosNotificationState();
}

class _SosNotificationState extends State<SosNotification> {

  bool isnotifiLoading = false;
  static const storage = FlutterSecureStorage();
  Future<Notification> NotifiFuture = GetNotification();


  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   usersFuture = getUsers();
  //
  //   setState(() {
  //     isUserLoading = true;
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotifiFuture = GetNotification();
    setState(() {
      isnotifiLoading =true;
    });
  }


  static Future<Notification> GetNotification() async {
    var loginResponse = await storage.read(key: 'LOGIN_RESS');

    var url = ApiConstants.Notificstion;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginResponse'
    };
    final response = await http.get(Uri.parse(url), headers: requestHeaders);
    final body = json.decode(response.body);
    print(body);
    return Notification.fromJson(jsonDecode(response.body));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: oxfordBlue,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: const Text(
              'Notifications',
              style: TextStyle(color: white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.notification_add),
            )
          ],
        ),
        body:
        //      !isnotifiLoading ? Center(
        //        child: CircularProgressIndicator(
        //        ),
        //      )
        // :
        FutureBuilder<Notification>(
          future: NotifiFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final notify = snapshot.data!;
                return NotifiList(notify);
              } else {
                return Center(child: Text('no data'));
              }
            }
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              color: Colors.grey.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        )
    );
  }
    Widget NotifiList(Notification notify) => Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.builder(
        itemCount: notify.data?.length,
        itemBuilder: (context, index) {
          print(notify.data);
          var Notifica = notify.data![index];
          return Card(
            shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ) ,
            color:absendicol,
            child: Padding(
              padding: const EdgeInsets.only(right: 5,left: 5,top: 30,bottom: 30),
              child: ListTile(
                leading:
                Image.asset(
                  'assets/icon/notification.png',
                  width: 55,
                ),
                title:
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('${notify.data![index].title}',style: TextStyle(fontSize: 22,color: oxfordBlue,fontWeight:FontWeight.bold),),
                ),
                subtitle:  Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text('${notify.data![index].message}',style: TextStyle(fontSize: 15,color: oxfordBlue,),),
                ),

                trailing:  Padding(
                  padding: const EdgeInsets.all(3.0),
                  child:   Image.asset(
                    'assets/icon/next.png',
                    width: 30,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewNotoficationsos(id: Notifica.id,)));
                },
              ),
            ),
          );
        },
      ),
    );
  }


// json

class Notification {
  String? message;
  bool? status;
  int? code;
  List<Data>? data;

  Notification({this.message, this.status, this.code, this.data});

  Notification.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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
  int? senderId;
  String? sender;
  String? title;
  String? message;
  String? image;
  String? link;
  int? linkId;
  String? type;
  String? employeeId;
  int? createdBy;
  String? createdAt;
  Null? updatedAt;
  String? deleted;

  Data(
      {this.id,
        this.senderId,
        this.sender,
        this.title,
        this.message,
        this.image,
        this.link,
        this.linkId,
        this.type,
        this.employeeId,
        this.createdBy,
        this.createdAt,
        this.updatedAt,
        this.deleted});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    sender = json['sender'];
    title = json['title'];
    message = json['message'];
    image = json['image'];
    link = json['link'];
    linkId = json['link_id'];
    type = json['type'];
    employeeId = json['employee_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['sender'] = this.sender;
    data['title'] = this.title;
    data['message'] = this.message;
    data['image'] = this.image;
    data['link'] = this.link;
    data['link_id'] = this.linkId;
    data['type'] = this.type;
    data['employee_id'] = this.employeeId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted'] = this.deleted;
    return data;
  }
}
