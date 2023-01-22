import '../components/color.dart';

import 'package:flutter/material.dart';

class leave_approval extends StatefulWidget {
  const leave_approval({super.key});

  @override
  State<leave_approval> createState() => _leave_approvalState();
}

class _leave_approvalState extends State<leave_approval> {
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
          'Leave Approval',
          style: TextStyle(color: white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 48,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "John Cena",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: oxfordBlue,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " Solar Instalation : London",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Holidays Details:",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Holidays",
                                      style: TextStyle(
                                          color: oxfordBlue,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "(10)",
                                      style: TextStyle(
                                          color: oxfordBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 144, 214, 247),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 80,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Taken",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: oxfordBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "(20)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: oxfordBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 168, 130, 234),
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 80,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: oxfordBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "(10)",
                                      style: TextStyle(
                                          color: oxfordBlue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: primaryGreen,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 113,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Carry Forword",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: oxfordBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "(10)",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: oxfordBlue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: litecol,
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: 150,
                decoration: BoxDecoration(
                  color: primaryIndigo,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            "Reason :",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "I'm suffering from Cold and fever, Having a Doctor appoinment",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('12,Jun, 2023',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: oxfordBlue)),
                  Text(' - ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: oxfordBlue)),
                  Text('12,Jun, 2023',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: oxfordBlue))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  width: double.infinity,
                  // height: 60.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: const StadiumBorder(),
                      primary: Color(0xFF2E7D32),
                      elevation: 8,
                      shadowColor: Colors.black87,
                    ),
                    onPressed: (() {}),
                    child: Text(
                      "Approve",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: SizedBox(
                  width: double.infinity,
                  // height: 60.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: const StadiumBorder(),
                      primary: Color(0xFFFF1704),
                      elevation: 8,
                      shadowColor: Colors.black87,
                    ),
                    onPressed: (() {}),
                    child: Text(
                      "Decline",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
