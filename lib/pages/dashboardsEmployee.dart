import 'package:flutter/material.dart';

import '../components/color.dart';
import 'Leave_manageTab.dart';
import 'leave_approval.dart';
import 'leave_approvalsRGB.dart';
import 'LeaveForm.dart';

class Dashboards extends StatefulWidget {
  const Dashboards({Key? key}) : super(key: key);
  @override
  State<Dashboards> createState() => _DashboardsState();
}
class _DashboardsState extends State<Dashboards> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryDarkIndigo,
              elevation: 0,
              title: Text(
                'joseph'
                // desiredMap.toString() != null && desiredMap.toString() != 'null'
                //     ? 'Hi, ' + desiredMap!['data']['name']
                //     : 'Hi, ',
                // style: TextStyle(color: primaryWhite),
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
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: primaryWhite),
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
                              style: TextStyle(color: primaryWhite, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
        // appBar: AppBar(
        //   backgroundColor: primaryDarkIndigo,
        //   elevation: 0,
        //   leading: InkWell(
        //     onTap: () {
        //
        //     },
        //     customBorder:
        //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //     splashColor: primaryWhite3,
        //     child: Container(
        //         child: Icon(
        //       Icons.menu,
        //       color: primaryWhite,
        //     )),
        //   ),
        //   title: Text(
        //     'Hi, Santhosh',
        //     style: TextStyle(color: primaryWhite),
        //   ),
        //   actions: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 20),
        //       child: Center(
        //         child: Stack(
        //           children: [
        //             Container(
        //               height: 40,
        //               width: 40,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(25),
        //                   color: primaryWhite),
        //             ),
        //             Positioned(
        //               top: 5,
        //               bottom: 5,
        //               right: 5,
        //               left: 5,
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 30,
        //                 width: 30,
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(25),
        //                   gradient: LinearGradient(
        //                     colors: [Colors.pink, Colors.white54],
        //                     begin: Alignment.topRight,
        //                     end: Alignment.bottomLeft,
        //                   ),
        //                 ),
        //                 child: Text(
        //                   'SOS',
        //                   style: TextStyle(
        //                       color: primaryWhite,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: primaryDarkIndigo),
                    ),
                    Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: primaryLightWhite,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'DashBoard Stats',
                          style: TextStyle(
                              color: primaryWhite,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
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
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
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
                                  Container(
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
                              Container(
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
                  Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      splashColor: primaryWhite,
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //         const AttendanceDetails()));
                      },
                      child: Container(
                        width: 180,
                        height: 180,
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
                                width: 85,
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
                        width: 180,
                        height: 180,
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
                                height: 90,
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Assignments',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryBlack),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'JOB :',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' Solar Panel Installation',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children:  [
                                  Text(
                                    'Address :',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' 82 great Eastern Street , Londan.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, right: 20, left: 20),
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'JOB :',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' Solar Panel Installation',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    'Address :',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' 82 great Eastern Street , Londan.',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: oxfordBlue,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
drawer: Drawer(
  backgroundColor: oxfordBlue,
  elevation: 15.0,
  child: Column(
    children:<Widget> [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
            Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   image:  NetworkImage(),
                  //   fit: BoxFit.fill,
                  // ),
                ),
              ),
                   const Icon(Icons.account_circle),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                // child: Text(
                //   desiredMap != null ? desiredMap!['data']['name'] : '',
                //   style: const TextStyle(
                //     fontSize: 20,
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                child: Text(
                  "Joseph Vicky",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "josephjo@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                // child: Text(
                //   desiredMap != null ? desiredMap!['data']['email'] : '',
                //   style: const TextStyle(color: Colors.white),
                // ),
              ),
              ElevatedButton(
                onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
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
       ListTile(
        leading: ConstrainedBox(
            constraints:
            BoxConstraints(minWidth: 30, minHeight: 30),
            child: Image.asset(
              'assets/icon/document.png',
              width: 10,
            )),
        title: Text(
          'Assignments',
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
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  LeaveTabs()));
        },
        child:  ListTile(
          leading: ConstrainedBox(
              constraints:
              BoxConstraints(minWidth: 30, minHeight: 30),
              child: Image.asset(
                'assets/icon/report.png',
                width: 10,
              )),
          title: Text(
            'Leave Management',
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
       ListTile(
        leading: ConstrainedBox(
            constraints:
            BoxConstraints(minWidth: 30, minHeight: 30),
            child: Image.asset(
              'assets/icon/company.png',
              width: 10,
            )),
        title: Text(
          'Company',
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
      ),
    ],
  ),
),
        // floatingActionButton: Container(
        //   height: 60,
        //   width: 60,
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //       onPressed: (){},
        //       child: Icon(Icons.text_snippet),
        //       backgroundColor: primaryDarkIndigo,
        //     ),
        //   ),
        // ),

      ),
      );
  }
}
