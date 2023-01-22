// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/pages/profile_page.dart';
import 'package:hr4u/utils.dart';

import '../components/color.dart';
import 'Employee/Leave_list.dart';
import 'Notification/SOSNotofication/SosNotification.dart';
import 'about.dart';
import 'addEmployees.dart';
import 'add_company.dart';
import 'attendance_details.dart';
import 'dashboardsEmployee.dart';
import 'employees_list.dart';
import 'leave_approval.dart';
import 'leave_approvalsRGB.dart';
import 'Notification/NormalNofification/notification.dart';

class DashboardStats extends StatefulWidget {
  const DashboardStats({Key? key}) : super(key: key);

  @override
  State<DashboardStats> createState() => _DashboardStatsState();
}

class _DashboardStatsState extends State<DashboardStats> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryDarkIndigo,
          elevation: 0,
          title: Text(
            // desiredMap.toString() != null && desiredMap.toString() != 'null'
            //     ? 'Hi, ' + desiredMap!['data']['name']
            //     : 'Hi, ',
            'Joseph ',
            style: TextStyle(color: primaryWhite),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: primaryWhite
                      ),
                    ),
                    Positioned(
                      top: 5,
                      bottom: 5,
                      right: 5,
                      left: 5,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.white54],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Text(
                          'SOS',
                          style: TextStyle(
                              color: primaryWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: primaryDarkIndigo),
                      ),
                      Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: primaryLightWhite,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Dashboard Statistics',
                        style: TextStyle(
                            color: primaryWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 55),

                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: primaryBlack),
                            color: primaryWhite),
                        child: Text(
                          'PUNCH',
                          style: TextStyle(color: primaryBlack, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>  notification_page()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(22),
                                            color: primaryYellow,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 1.0,
                                              ),
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30,
                                              right: 15,
                                              left: 15,
                                              bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Notifications',
                                                style: TextStyle(
                                                  color: primaryBlack,
                                                  fontSize: 22,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 40,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      border: Border.all(
                                                          color: primaryBlack),
                                                      color: primaryWhite),
                                                  child: Text(
                                                    'View Details',
                                                    style: TextStyle(
                                                        color: primaryBlack),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: -0.1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: primaryLightRed
                                    ),
                                    child: Text(
                                      '5',
                                      style: TextStyle(color: primaryWhite),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap:(){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  SosNotification()));
                                  } ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(22),
                                        color: primaryBink,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 0.0),
                                            blurRadius: 1.0,
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30,
                                          right: 15,
                                          left: 15,
                                          bottom: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'SOS',
                                            style: TextStyle(
                                              color: primaryBlack,
                                              fontSize: 22,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding:
                                            const EdgeInsets.all(12.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      30),
                                                  border: Border.all(
                                                      color: primaryBlack),
                                                  color: primaryWhite),
                                              child: Text(
                                                'View Details',
                                                style: TextStyle(
                                                    color: primaryBlack),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primaryIndigo),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Total VAT Bills',
                              style: TextStyle(color: primaryBlack),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 30, top: 2, bottom: 2
                              ),
                              child: Container(
                                width: 37,
                                height: 37,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryDarkIndigo),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '12',
                                    style: TextStyle(color: primaryWhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Employees_List()));
                      },
                      child: Container(
                        height: 45,
                        width: 185,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryIndigo),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Total Employees',
                                style: TextStyle(color: primaryBlack),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 2, bottom: 2),
                                child: Container(
                                  width: 37,
                                  height: 37,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: primaryDarkIndigo),
                                  child: Text(
                                    '125',
                                    style: TextStyle(
                                      color: primaryWhite,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 45,
                      width: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primaryRed),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Absent Today',
                              style: TextStyle(color: primaryBlack),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 35, top: 2, bottom: 2),
                              child: Container(
                                width: 37,
                                height: 37,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryDarkRed),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '17',
                                    style: TextStyle(color: primaryWhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 185,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primaryGreen),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Present Today',
                              style: TextStyle(color: primaryBlack),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 2,
                                bottom: 2,
                              ),
                              child: Container(
                                width: 37,
                                height: 37,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryDarkGreen),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '85',
                                    style: TextStyle(color: primaryWhite),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top:2,left: 35,bottom: 10),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Employee Masters',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: oxfordBlue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        splashColor: primaryWhite,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AttendanceDetails()));
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: primaryLightBlack),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 25, right: 25, bottom: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icon/statistics.png',
                                  width: 65,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Attendance',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: oxfordBlue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Report',
                                  style: TextStyle(
                                      color: oxfordBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboards()));
                        },
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        splashColor: primaryWhite,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: primaryLightBlack),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 25, right: 25, bottom: 20),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/icon/machine.png',
                                  height: 65,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Mark',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: oxfordBlue,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  'Attendance',
                                  style: TextStyle(
                                      color: oxfordBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  LeaveList()));
                        },
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        splashColor: primaryWhite,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: primaryLightBlack),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, right: 20, bottom: 25),
                            child:
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/Leaveman.png',
                                  height: 55,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Leave',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: oxfordBlue,
                                  ),
                                ),
                                Text(
                                  'Management',
                                  style: TextStyle(
                                      color: oxfordBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),

                      child: InkWell(
                        onTap: () async {
                          const storage = FlutterSecureStorage();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       AddEmployeePage())
                          );
                          // var loginResponse = await storage.read(key: 'LOGIN_RESS');
                          // if (loginResponse != null)
                          // {
                          //   Map resBodyMap = jsonDecode(loginResponse);
                          //   desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
                          //   // print(desiredMap);
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text("Sending Message $desiredMap"),
                          //   ));
                          // }

                        },
                        customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        splashColor: primaryWhite,
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: primaryLightBlack),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 32, right: 32, bottom: 10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/employees-add.png',
                                  height: 65,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Add',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: oxfordBlue,
                                  ),
                                ),
                                Text(
                                  'Employees',
                                  style: TextStyle(
                                      color: oxfordBlue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: oxfordBlue,
          elevation: 15.0,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      desiredMap != null
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // image: DecorationImage(
                                //   image:  NetworkImage(),
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                            )
                          : const Icon(Icons.account_circle),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                        //  desiredMap != null ? desiredMap!['data']['name'] : '',
                          'Vicky',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          // desiredMap != null
                          //     ? desiredMap!['data']['email']
                          //     : '',
                          'jo@gmail.com',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: oxfordBlue,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: const Size(150, 40)),
                        child: const Text('View profile'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
               ListTile(
                leading: ConstrainedBox(
                    constraints:
                    BoxConstraints(minWidth: 30, minHeight: 30),
                    child: Image.asset(
                      'assets/icon/open-menu.png',
                      width: 10,
                    )),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: null,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
               ListTile(
                leading: ConstrainedBox(
                    constraints:
                    BoxConstraints(minWidth: 30, minHeight: 30),
                    child: Image.asset(
                      'assets/icon/company.png',
                      width: 10,
                    )),
                title: Text(
                  'Company Details',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: null,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
               ListTile(
                leading: ConstrainedBox(
                    constraints:
                    BoxConstraints(minWidth: 30, minHeight: 30),
                    child: Image.asset(
                      'assets/icon/caution-triangle.png',
                      width: 10,
                    )),
                title: Text(
                  'Visa Expiry Employees',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: null,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
               ListTile(
                leading: ConstrainedBox(
                    constraints:
                    BoxConstraints(minWidth: 30, minHeight: 30),
                    child: Image.asset(
                      'assets/icon/bill.png',
                      width: 10,
                    )),
                title: Text(
                  'VAT Bills',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: null,
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child:  ListTile(
                  leading: ConstrainedBox(
                      constraints:
                      BoxConstraints(minWidth: 30, minHeight: 30),
                      child: Image.asset(
                        'assets/icon/information.png',
                        width: 10,
                      )),
                  title: Text(
                    'About App',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  onTap: null,
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
              InkWell(
                  onTap: () {
                    showAlert(context);
                  },
                  child:  ListTile(
                    leading: ConstrainedBox(
                        constraints:
                        BoxConstraints(minWidth: 30, minHeight: 30),
                        child: Image.asset(
                          'assets/icon/logout.png',
                          width: 10,
                        )),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onTap: null,
                  )),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout!!!'),
          content: const Text("Are You Sure Want To Logout ?"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("YES"),
              onPressed: () async {
                await _storage.write(key: 'LOGIN_RES', value: null);
                Utils.showSnackBar(context, 'Logout Successfully');
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ElevatedButton(
              child: const Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
