import 'package:flutter/material.dart';

import '../components/color.dart';
import '../model/punchin.dart';
import '../model/punchout.dart';
import 'Employee/BankHolidays.dart';
import 'Employee/Myleave.dart';
import 'LeaveForm.dart';

class LeaveTabs extends StatefulWidget {
  const LeaveTabs({Key? key}) : super(key: key);

  @override
  State<LeaveTabs> createState() => _LeaveTabsState();
}

class _LeaveTabsState extends State<LeaveTabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
            "Leave Management",
            style: TextStyle(color: white),
          ),
        ),
        actions: [
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text("Apply For Leave"),
                  // onTap: (){
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>  const LeaveManagement()));
                  // },
                ),
                //
                // PopupMenuItem<int>(
                //   value: 1,
                //   child: Text("Settings"),
                // ),
                //
                // PopupMenuItem<int>(
                //   value: 2,
                //   child: Text("Logout"),
                // ),
              ];
            },
            onSelected: (result) {
              if (result == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveManagement()),
                );
              }
            },
            // onSelected:(value){
            //   if(value == 0){
            //     print("My account menu is selected.");
            //   }else if(value == 1){
            //     print("Settings menu is selected.");
            //   }else if(value == 2){
            //     print("Logout menu is selected.");
            //   }
            // }
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: 'My Leave ',
            ),
            Tab(
              text: 'Bank Holidays ',
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new MyLeave(),
          new BankHolidays(),
        ],
      ),
    );
  }
}
