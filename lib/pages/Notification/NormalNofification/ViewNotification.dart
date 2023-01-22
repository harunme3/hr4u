import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../components/color.dart';
import '../../../constant/constants.dart';
import 'package:http/http.dart' as http;

class ViewNotoficationNormal extends StatefulWidget {
  final int? id;
  const ViewNotoficationNormal({super.key, required this.id});

  @override
  State<ViewNotoficationNormal> createState() => _ViewNotoficationNormalState();
}

class _ViewNotoficationNormalState extends State<ViewNotoficationNormal> {
  static const storage = FlutterSecureStorage();

  Future getNotifications() async {
    var loginResponse = await storage.read(key: 'LOGIN_RESS');
    var url = ApiConstants.baseUrl + 'notification/' + widget.id.toString();
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginResponse'
    };
    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    final body = json.decode(response.body);
    print(response.body);
    return body;
  }

  @override
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
              // Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: const Text(
              'View Notifications',
              style: TextStyle(color: white),
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/icon/delete.jpg')),
          ],
        ),
        body: FutureBuilder(
          future: getNotifications(),
          builder: (context, snapshot) {
            // print(snapshot);
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final users = snapshot.data!;
                Map<String, dynamic> DetailsNotifi =
                    users as Map<String, dynamic>;
                print(DetailsNotifi);
                return NotifiDetails(DetailsNotifi);
              } else {
                return Center(child: Text('no data'));
              }
            }
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            );
          },
        ));
  }

  Widget NotifiDetails(DetailsNotifi) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: <Widget>[
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.grey[350],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icon/alert.png',
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sender : ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: oxfordBlue,
                                ),
                              ),
                              Text(
                                DetailsNotifi['data']['sender'],
                                style: TextStyle(
                                  fontSize: 20,
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
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            DetailsNotifi['data']['title'],
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: oxfordBlue,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            DetailsNotifi['data']['message'],
                             style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: oxfordBlue,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Text(
                        //     'Time :',
                        //     style: TextStyle(
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.w800,
                        //       color: Colors.grey
                        //
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            DetailsNotifi['data']['created_at'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.share),
                  // ),
                ],
              ),

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 350,
                    left: 20,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.share,
                            color: oxfordBlue,
                          ),
                        ),
                        TextSpan(
                            text: '  Share',
                            style: TextStyle(
                              color: oxfordBlue,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
