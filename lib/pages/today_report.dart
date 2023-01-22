import 'package:flutter/material.dart';

import '../components/color.dart';
import '../model/punchin.dart';
import '../model/punchout.dart';

class TodayReport extends StatefulWidget {
  const TodayReport({Key? key}) : super(key: key);

  @override
  State<TodayReport> createState() => _TodayReportState();
}

class _TodayReportState extends State<TodayReport>
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
          onPressed: () {},
        ),
        title: Center(
          child: const Text(
            "Today's Report",
            style: TextStyle(color: white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/icon/attenadd.png'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: 'Punch IN ',
            ),
            Tab(
              text: 'Punch OUT ',
            ),
          ],
        ),
      ),
      // body: TabBar(
      //   controller: _tabController,
      //   tabs: <Widget>[
      //     Tab(
      //       text: 'Punch IN ',
      //     ),
      //     Tab(
      //       text: 'Punch OUT ',
      //     ),
      //   ],
      // ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new punchin(),
          new punchout(),
        ],
      ),
    );
  }
}
