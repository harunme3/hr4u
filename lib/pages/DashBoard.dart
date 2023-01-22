// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/utils.dart';

import '../components/color.dart';
import 'AttendanceDetails.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final _storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Mycolors.primary,
          elevation: 0,
          title: const Text(
            'Hi, Santhosh',
            style: TextStyle(color: Mycolors.white),
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
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Mycolors.white),
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
                            colors: [Mycolors.red, Mycolors.white],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Text(
                          'sos'.toUpperCase(),
                          style: const TextStyle(color: Mycolors.white, fontWeight: FontWeight.bold, fontSize: 12),
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
                        height: 200,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: Mycolors.primary),
                      ),
                      Container(
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Dashboard Stats',
                            style: TextStyle(color: Mycolors.white, fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(color: Mycolors.white, borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'punch'.toUpperCase(),
                              style: const TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
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
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(22),
                                        color: Mycolors.lightYellow,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'Notifications',
                                              style: TextStyle(
                                                  color: Mycolors.primary, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 30,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    border: Border.all(color: Mycolors.black),
                                                    color: Mycolors.white),
                                                child: const Text(
                                                  'View Details',
                                                  style: TextStyle(color: Mycolors.black),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    right: -0.1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 25,
                                      width: 25,
                                      decoration:
                                          BoxDecoration(borderRadius: BorderRadius.circular(15), color: Mycolors.red),
                                      child: const Text(
                                        '5',
                                        style: TextStyle(color: Mycolors.white),
                                      ),
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22),
                                    color: Mycolors.lightPink,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30, right: 15, left: 15, bottom: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'SOS',
                                          style: TextStyle(
                                              color: Mycolors.primary, fontSize: 18, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: Mycolors.black),
                                                color: Mycolors.white),
                                            child: const Text(
                                              'View Details',
                                              style: TextStyle(color: Mycolors.black),
                                            ),
                                          ),
                                        )
                                      ],
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
                      height: 35,
                      width: 165,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Mycolors.paleLavender),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total VAT Bills',
                              style: TextStyle(color: Mycolors.primary),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                              child: Container(
                                alignment: Alignment.center,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(15), color: Mycolors.primary),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '12',
                                    style: TextStyle(color: Mycolors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 165,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Mycolors.paleLavender),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Employees',
                              style: TextStyle(color: Mycolors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(15), color: Mycolors.primary),
                                child: const Text(
                                  '125',
                                  style: TextStyle(
                                    color: Mycolors.white,
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 35,
                      width: 165,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Mycolors.paleRed),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Absent Today',
                              style: TextStyle(color: Mycolors.primary),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                              child: Container(
                                alignment: Alignment.center,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(15), color: Mycolors.merun),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '17',
                                    style: TextStyle(color: Mycolors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 165,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Mycolors.paleGreen),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Present Today',
                              style: TextStyle(color: Mycolors.primary),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 2, bottom: 2),
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 30,
                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(15), color: Mycolors.green),
                                child: const Text(
                                  '85',
                                  style: TextStyle(
                                    color: Mycolors.white,
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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Employee Masters',
                    style: TextStyle(color: Mycolors.primary, fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => const AttendanceDetailsx()));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Mycolors.lightGrey, borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/attendance_report.jpg',
                              height: 80,
                            ),
                            const Text(
                              'Attendance',
                              style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                            ),
                            const Text(
                              'Report',
                              style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Mycolors.lightGrey, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/mark_attendance.jpg',
                            width: 120,
                            height: 80,
                          ),
                          const Text(
                            'Mark',
                            style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                          const Text(
                            'Attendance',
                            style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(color: Mycolors.lightGrey, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/track_employees.jpg',
                            height: 80,
                            width: 110,
                          ),
                          const Text(
                            'Track',
                            style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                          const Text(
                            'Employees',
                            style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Mycolors.lightGrey, borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/add_employees.jpg',
                            height: 80,
                            width: 120,
                          ),
                          const Text(
                            'Add',
                            style: TextStyle(color: Mycolors.primary, fontWeight: FontWeight.w900, fontSize: 18),
                          ),
                          const Text(
                            'Employees',
                            style: TextStyle(
                              color: Mycolors.primary,
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Adam Joe',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'adamjoe@hrm4you.com',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
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
              const ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
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
              const ListTile(
                leading: Icon(
                  Icons.inbox,
                  color: Colors.white,
                ),
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
              const ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
                title: Text(
                  'About App',
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
                    showAlert(context);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
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
