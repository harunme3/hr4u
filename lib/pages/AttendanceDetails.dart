import 'package:flutter/material.dart';

import '../components/color.dart';


class AttendanceDetailsx extends StatefulWidget {
  const AttendanceDetailsx({Key? key}) : super(key: key);

  @override
  State<AttendanceDetailsx> createState() => _AttendanceDetailsxState();
}

class _AttendanceDetailsxState extends State<AttendanceDetailsx> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Mycolors.primary,
            leading: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded, color: Mycolors.white,)),
            title: const Text('Attendance Details',
            style: TextStyle(
              color: Mycolors.white
            ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  const [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Edit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: Icon(Icons.edit, size: 18,),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration:  BoxDecoration(
                        gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Mycolors.white,
                          Mycolors.skyBlue,
                        ],
                      ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration:  BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Mycolors.white,
                              Mycolors.skyBlue,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.check, color: Mycolors.white, size: 50,),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text('12 June 2022',
                style: TextStyle(
                  color: Mycolors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Mycolors.grey,
                          offset: Offset(0.2, 0.2), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Mycolors.white,
                            Mycolors.lightWhite,
                          ],
                        ),
                        border: Border.all(
                            color: Mycolors.black
                        ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 180.0),
                          child: Text('punch in'.toUpperCase(),
                          style: const TextStyle(
                            color: Mycolors.skyBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Icon(Icons.calendar_month, size: 40, color: Mycolors.primary,),
                            ),
                            SizedBox(width: 10,),
                            Text('09.00 AM',
                            style: TextStyle(
                              color: Mycolors.primary,
                              fontSize: 18
                            ),
                            )
                          ],
                        ),
                       const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left:30.0),
                              child: Icon(Icons.location_pin, size: 40, color: Mycolors.primary,),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('# 5 Archer Street,',
                                style: TextStyle(
                                    color: Mycolors.primary,
                                    fontSize: 18
                                ),
                                ),
                                Text('London, United Kingdom.',
                                  style: TextStyle(
                                      color: Mycolors.primary,
                                      fontSize: 18
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    height: 150,
                    width: 350,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Mycolors.grey,
                          offset: Offset(0.2, 0.2), //(x,y)
                          blurRadius: 2.0,
                        ),
                      ],
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Mycolors.white,
                            Mycolors.lightWhite,
                          ],
                        ),
                        border: Border.all(
                            color: Mycolors.black
                        ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 180.0),
                          child: Text('punch out'.toUpperCase(),
                          style: const TextStyle(
                            color: Mycolors.skyBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: Icon(Icons.calendar_month, size: 40, color: Mycolors.primary,),
                            ),
                            SizedBox(width: 10,),
                            Text('06.00 PM',
                            style: TextStyle(
                              color: Mycolors.primary,
                              fontSize: 18
                            ),
                            )
                          ],
                        ),
                       const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left:30.0),
                              child: Icon(Icons.location_pin, size: 40, color: Mycolors.primary,),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('# 5 Archer Street,',
                                style: TextStyle(
                                    color: Mycolors.primary,
                                    fontSize: 18
                                ),
                                ),
                                Text('London, United Kingdom.',
                                  style: TextStyle(
                                      color: Mycolors.primary,
                                      fontSize: 18
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: InkWell(
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onTap: (){},
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Mycolors.red,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Mycolors.black),
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              height: 48,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: const Text('Mark As Absent',
                                style: TextStyle(
                                  color: Mycolors.white,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
