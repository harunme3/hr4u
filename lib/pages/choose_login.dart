// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hr4u/pages/dashboard_state.dart';
import 'package:hr4u/routes.dart';

import '../components/help_component.dart';
import 'package:hr4u/components/color.dart';

class ChooseLoginPage extends StatefulWidget {
  const ChooseLoginPage({Key? key}) : super(key: key);

  @override
  State<ChooseLoginPage> createState() => _ChooseLoginPageState();
}

class _ChooseLoginPageState extends State<ChooseLoginPage> {
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  loginCheck() async {
    var loginResponse = await _storage.read(key: 'LOGIN_RES');
    if (loginResponse != null) {
      Map resBodyMap = jsonDecode(loginResponse);
      Map<String, dynamic> desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
      if (desiredMap['status'] == true) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardStats()));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: oxfordBlue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Center(
                    child:
                        ImageWrapper(image: "assets/images/logo.png", wid: 4),
                  ),

                  const Center(
                    child: Text(
                      "HR Solutions",
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  // InkWell( onTap: () => Navigator.pushNamed(context, Routes.allScreen),
                  //   child: const Center(
                  //   child: Text(
                  //     "Click here for all screens",
                  //     style: TextStyle(color: Colors.white, fontSize: 25),
                  //   ),
                  // ),),
                  const SizedBox(
                    height: 120,
                  ),
                  const Center(
                    child: Text(
                      "A Complete HR Solutions for your \n                      Enterprise.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color:greybglo,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child:  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        const Center(
                          child: Text(
                            "Choose Your Login",
                            style: TextStyle(color: oxfordBlue, fontSize: 30),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            InkWell(
                              onTap: () => Navigator.pushNamed(context, Routes.login),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: ImageWrapper(
                                        image: "assets/images/admin.png", wid: 5),
                                  ),
                                  Center(
                                    child: Text(
                                      "Admin",
                                      style: TextStyle(color: oxfordBlue, fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(context, Routes.about),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: ImageWrapper(
                                        image: "assets/images/manager.png", wid: 5),
                                  ),
                                  Center(
                                    child: Text(
                                      "HR",
                                      style: TextStyle(color: oxfordBlue, fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pushNamed(context, Routes.login),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: ImageWrapper(
                                        image: "assets/images/emp.png", wid: 5),
                                  ),
                                  Center(
                                    child: Text(
                                      "Employee",
                                      style: TextStyle(color: oxfordBlue, fontSize: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
