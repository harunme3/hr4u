import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hr4u/pages/about.dart';
import 'package:hr4u/pages/dashboard_state.dart';
import 'package:hr4u/pages/dashboardsEmployee.dart';
import 'package:hr4u/pages/pages.dart';
import 'package:hr4u/routes.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper.dart';
import 'package:hr4u/utils/storage_helpers/storage_helper_string.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'pages/allScreen.dart';
import 'pages/onboard_screen.dart';

// @override
// void initState() {
//   FirebaseMessaging _firebaseMessaging =
//       FirebaseMessaging.instance; // Change here
//   _firebaseMessaging.getToken().then((token) {
//     print("token is $token");
//   });
// }

// Future<void> _firebaseMessagingBackgroundHandler(message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options:
  // );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await StorageHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      home: StorageHelper.instance
                  .getBool(StorageHelperString.isUserLoggedIn) ??
              false
          ? (StorageHelper.instance.getInt(StorageHelperString.loginUserType) ??
                      3) ==
                  1
              ? const DashboardStats()
              : const Dashboards()
          : StorageHelper.instance
                      .getBool(StorageHelperString.isUserCompleteOnBaord) ??
                  false
              ? const LoginPage()
              : const OnBoardScreen(),
      // initialRoute: Routes.chooseLogin,
      // onGenerateRoute: (RouteSettings settings) {
      //   return Routes.fadeThrough(settings, (context) {
      //     switch (settings.name) {
      //       case Routes.chooseLogin:
      //         return const ChooseLoginPage();
      //       case Routes.login:
      //         return const LoginPage();
      //       case Routes.about:
      //         return const AboutPage();
      //       case Routes.style:
      //         return const TypographyPage();
      //       case Routes.allScreen:
      //         return const AllScreenPage();
      //       default:
      //         return const SizedBox.shrink();
      //     }
      //   });
      // },
      debugShowCheckedModeBanner: false,
    );
  }
}
