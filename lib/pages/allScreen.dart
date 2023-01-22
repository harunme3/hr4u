// import 'package:flutter/material.dart';
// import 'package:hr4u/pages/about.dart';
// import 'package:hr4u/pages/pass_reset.dart';
// import 'package:hr4u/pages/sosscreen.dart';
// import 'package:hr4u/pages/Notification/SOSNotofication/ViewSosNotification.dart';
// import 'package:hr4u/pages/success_pass_reset.dart';
// import 'package:hr4u/pages/today_report.dart';
// import 'package:hr4u/pages/upload_document.dart';
// import 'package:hr4u/pages/vat_list.dart';
//
// import 'AttendanceDetails.dart';
// import 'DashBoard.dart';
// import 'add_vat_bill.dart';
// import 'addEmployees.dart';
// import 'attendance_details.dart';
// import 'attendance_listview.dart';
// import 'attendance_report.dart';
// import 'check_mail.dart';
// import 'create_new_pass.dart';
// import 'dashboard_state.dart';
// import 'dashboard_stats_punch.dart';
// import 'dashboardsEmployee.dart';
// import 'employees_list.dart';
// import 'leave_approval.dart';
//
// import 'Notification/NormalNofification/notification.dart';
//
// class AllScreenPage extends StatelessWidget {
//   const AllScreenPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All Screens"),
//       ),
//       body: ListView(
//         children: <Widget>[
//           InkWell(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const AboutPage())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('AboutPage'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const VatBill())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Add VatBill'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const AddEmployeePage())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Add Employees'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const AttendanceDetails())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('AttendanceDetails'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const Atten_Report_page())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Atten_Report_page'),
//               )),
//           InkWell(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const attendancereport())),
//             child: const ListTile(
//               leading: Icon(Icons.person_add),
//               title: Text('attendancereport'),
//             ),
//           ),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const AttendanceDetailsx())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Attendance'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const CheckYourMail())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('CheckYourMail'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const CreateNewPass())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('CreateNewPass'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const DashBoard())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('DashBoard'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const DashboardStats())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('DashboardStatsb'),
//               )),
//           InkWell(
//               // onTap: () => Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //         builder: (context) => const Employees_List())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Employees_List'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const notification_page())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('notification_page'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ResetPasswordScreen())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('ResetPasswordScreen'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SosScreen_page())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('SosScreen_page'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SosViewNotification())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('SosViewNotification'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const Sucess_pass_reset())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Sucess_pass_reset'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const TodayReport())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('TodayReport'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const Vat_List_page())),
//
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('Vat_List_page'),
//               )),
//           InkWell(
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>  leave_approval())),
//               child: const ListTile(
//                 leading: Icon(Icons.person_add),
//                 title: Text('leave_approval'),
//               )),
//           InkWell(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const dashboard_stats_punch())),
//             child: const ListTile(
//               leading: Icon(Icons.arrow_forward),
//               title: Text('Dashboard_State_punch'),
//             ),
//           ),
//           InkWell(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const upload_document())),
//             child: const ListTile(
//               leading: Icon(Icons.arrow_forward),
//               title: Text('upload_document'),
//             ),
//           ),
//           InkWell(
//             onTap: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const Dashboards())),
//             child: const ListTile(
//               leading: Icon(Icons.arrow_forward),
//               title: Text('upload_document'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
