// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:hr4u/pages/about.dart';
import 'package:hr4u/pages/profile_page.dart';
import '../api_models/addEmployeeModel.dart';
import '../components/color.dart';
import '../utils.dart';

class dashboard_stats_punch extends StatefulWidget {
  const dashboard_stats_punch({Key? key}) : super(key: key);

  @override
  State<dashboard_stats_punch> createState() => _dashboard_stats_punchState();
}

class _dashboard_stats_punchState extends State<dashboard_stats_punch> {
  final _storage = const FlutterSecureStorage();
  Map? desiredMap;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loginCheck();
  }

  loginCheck() async {
    var loginResponse = await _storage.read(key: 'LOGIN_RES');
    if (loginResponse != null) {
      Map resBodyMap = jsonDecode(loginResponse);
      desiredMap = resBodyMap.map((key, value) => MapEntry(key, value));
      setState(() {
        desiredMap = desiredMap;
      });
    }
  }

  // String? _currentAddress;
  // Position? _currentPosition;

  // Future<bool> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     setState(() {
  //       loading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location services are disabled. Please enable the services')));
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       setState(() {
  //         loading = false;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     setState(() {
  //       loading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();

  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() => _currentPosition = position);
  //     _getAddressFromLatLng(_currentPosition!);
  //   }).catchError((e) {
  //     setState(() {
  //       loading = false;
  //     });
  //     debugPrint(e);
  //   });
  // }

  // Future<void> _getAddressFromLatLng(Position position) async {
  //   await placemarkFromCoordinates(
  //           _currentPosition!.latitude, _currentPosition!.longitude)
  //       .then((List<Placemark> placemarks) {
  //     Placemark place = placemarks[0];
  //     setState(() {
  //       _currentAddress =
  //           '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
  //     });
  //   }).catchError((e) {
  //     setState(() {
  //       loading = false;
  //     });
  //     debugPrint(e);
  //   });
  // }

  // punchInSave() async {
  //   await _getAddressFromLatLng(_currentPosition!);
  //   setState(() {
  //     loading = true;
  //   });
  //   var res = await ApiService.punchIn(_currentPosition?.latitude ?? "",
  //       _currentPosition?.longitude ?? "", _currentAddress ?? "");
  //   Map resBodyMap = jsonDecode(res);
  //   Map? desiredResMap = resBodyMap.map((key, value) => MapEntry(key, value));
  //   if (kDebugMode) {
  //     print(desiredResMap);
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  //   Utils.showSnackBar(context, desiredResMap['message']);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: primaryDarkIndigo,
          elevation: 0,
          // leading: InkWell(
          //   onTap: () {},
          //   customBorder:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          //   splashColor: primaryWhite3,
          //   child: Container(
          //       child: Icon(
          //     Icons.menu,
          //     color: primaryWhite,
          //   )),
          // ),
          title: Text(
            desiredMap.toString() != null && desiredMap.toString() != 'null'
                ? 'Hi, ' + desiredMap!['data']['employee_name']
                : 'Hi, ',
            style: TextStyle(color: primaryWhite),
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: primaryWhite),
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
                          style: TextStyle(
                              color: primaryWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: oxfordBlue,
          elevation: 15.0,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      desiredMap != null
                          ? Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                // image: DecorationImage(
                                //   image:  NetworkImage(),
                                //   fit: BoxFit.fill,
                                // ),
                              ),
                            )
                          : const Icon(Icons.account_circle),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          desiredMap != null
                              ? desiredMap!['data']['employee_name']
                              : '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          desiredMap != null
                              ? desiredMap!['data']['email']
                              : '',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfilePage()));
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
              const ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
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
              const ListTile(
                leading: Icon(
                  Icons.storefront,
                  color: Colors.white,
                ),
                title: Text(
                  'Company Details',
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
              const ListTile(
                leading: Icon(
                  Icons.supervisor_account,
                  color: Colors.white,
                ),
                title: Text(
                  'Visa Expiry Employees',
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
              const ListTile(
                leading: Icon(
                  Icons.inbox,
                  color: Colors.white,
                ),
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.account_box,
                    color: Colors.white,
                  ),
                  title: Text(
                    'About App',
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
              InkWell(
                  onTap: () {
                    showAlert(context);
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onTap: null,
                  )),
              const Divider(
                height: 0,
                thickness: 1,
                color: Colors.white70,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: primaryDarkIndigo),
                      ),
                      Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            color: primaryLightWhite,
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'DashBoard Stats',
                        style: TextStyle(
                            color: primaryWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
                  // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
                  // Text('ADDRESS: ${_currentAddress ?? ""}'),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: oxfordBlue,
                          backgroundColor: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text('PUNCH'),
                        onPressed: () async {
                          // setState(() {
                          //   loading = true;
                          // });
                          // await _getCurrentPosition();
                          // await punchInSave();
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                              offset: Offset(0.0, 0.0), //(x,y)
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
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 25,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
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
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: primaryLightRed),
                                      child: Text(
                                        '5',
                                        style: TextStyle(color: primaryWhite),
                                      ),
                                    ))
                              ],
                            ),
                            // SizedBox(width: 12,),
                            Column(
                              children: [
                                Container(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: primaryBink,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.0), //(x,y)
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
                                          'sos'.toUpperCase(),
                                          style: TextStyle(
                                              color: primaryBlack,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
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
                // padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.grey[300],
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/icon/statistics.png',
                                  height: 60,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      ' Attendance Report',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: oxfordBlue,
                                      ),
                                    ),
                                  ],
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.grey[300],
                          ),
                        ),
                        Positioned.fill(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Image.asset(
                                  'assets/icon/report.png',
                                  height: 60,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      ' VAT Bills',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: oxfordBlue,
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        ),
      ),
      if (loading)
        const Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
      if (loading)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ]));
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout!!!'),
          content: const Text("Are You Sure Want To Logout ?"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("YES"),
              onPressed: () async {
                await _storage.write(key: 'LOGIN_RES', value: null);
                Utils.showSnackBar(context, 'Logout Successfully');
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            ElevatedButton(
              child: const Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
