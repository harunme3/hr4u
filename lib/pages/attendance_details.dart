import 'package:flutter/material.dart';

import '../components/color.dart';



class AttendanceDetails extends StatefulWidget {
  const AttendanceDetails({Key? key}) : super(key: key);

  @override
  State<AttendanceDetails> createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:  AppBar(
            backgroundColor:primaryDarkIndigo,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              splashColor: primaryWhite3,
              child: Container(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: primaryWhite,
                  )),
            ),
            title: Text(
              'Attendance Details',
              style: TextStyle(
                  color: primaryWhite),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Edit'),
                    // Stack(
                    //   children: [
                    //     Container(
                    //       height: 20,
                    //       width: 20,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(4),
                    //         border: Border.all(color: primaryBlack)
                    //       ),
                    //     ),
                    //     Positioned(
                    //       top: 0,
                    //         left: 0,
                    //         child: Icon(Icons.edit, size: 15,)),
                    //   ],
                    // ),
                    SizedBox(width: 8,),
                    Icon(Icons.edit_rounded,  size: 15)
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [Color(0xFFBBDEFB), Color(
                          0xFFE3F2FD)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [Color(0xb5374abe), Color(
                            0xFF42A5F5)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Icon(
                        Icons.check, size: 30, color: primaryWhite,
                      )
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Text('12 June 2022',
              style: TextStyle(
                color: primaryBlack,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
              Expanded(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(color: primaryBlack),
                                  color: Color(0xFFEAECEE)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30, left: 30, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('PUNCH IN',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: primarySkyBlue,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        ShaderMask(
                                          blendMode: BlendMode.srcATop,
                                          shaderCallback: (Rect bounds) {
                                            return RadialGradient(
                                              center: Alignment.center,
                                              radius: 1.0,
                                              colors: <Color>[
                                                Color(0xb5374abe),
                                                Color(0xFF42A5F5)
                                              ],
                                              tileMode: TileMode.repeated,
                                            ).createShader(bounds);
                                          },
                                          child: Icon(
                                            Icons.calendar_today_outlined,
                                            size: 30.0,
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text('09:00 AM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12
                                              ),)
                                      ],
                                    ),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        ShaderMask(
                                          blendMode: BlendMode.srcATop,
                                          shaderCallback: (Rect bounds) {
                                            return RadialGradient(
                                              center: Alignment.center,
                                              radius: 1.0,
                                              colors: <Color>[
                                                Color(0xb5374abe),
                                                Color(0xFF42A5F5)
                                              ],
                                              tileMode: TileMode.repeated,
                                            ).createShader(bounds);
                                          },
                                          child: Icon(
                                            Icons.location_on_sharp,
                                            size: 30.0,
                                          ),
                                        ),
                                        // Icon(Icons.location_on_sharp, color: primaryDarkIndigo, size: 30,),
                                        SizedBox(width: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('#5 Archer Street,',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12
                                            ),),
                                            Text('London, United Kingdom,',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              fontSize: 12
                                            ),)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 10, bottom:15 ),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onTap: (){
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        color: primaryLightRed,
                        borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryBlack),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text('Mark As Absent',
                        style: TextStyle(
                          color: primaryWhite,
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
