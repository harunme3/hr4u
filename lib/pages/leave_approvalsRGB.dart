import 'package:flutter/material.dart';

import '../components/color.dart';

class leave_approvals extends StatefulWidget {
  const leave_approvals({super.key});

  @override
  State<leave_approvals> createState() => _leave_approvalsState();
}

class _leave_approvalsState extends State<leave_approvals> {
  Widget leavestatus(String title, String color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.symmetric(vertical: 14),
        shape: const StadiumBorder(),
        backgroundColor: Colors.green,
        elevation: 8,
        shadowColor: Colors.black87,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

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
            onPressed: () {},
          ),
          title: const Text(
            'Leave Approvals',
            style: TextStyle(color: white),
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14 Feb 2021",
                          style: TextStyle(
                              fontSize: 18,
                              color: oxfordBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Need a Leave For going to hospital",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    // leavestatus(
                    //   "pending",
                    // )
                    leavestatus("approved", "red")
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14 Feb 2021",
                          style: TextStyle(
                              fontSize: 18,
                              color: oxfordBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Need a Leave For going to hospital",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    // leavestatus(
                    //   "pending",
                    // )
                    leavestatus("approved", "red")
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "14 Feb 2021 - 15 feb 2021",
                          style: TextStyle(
                              fontSize: 18,
                              color: oxfordBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Need a Leave For going to hospital",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    // leavestatus(
                    //   "pending",
                    // )
                    leavestatus("approved", "red")
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
