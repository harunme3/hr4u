import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class myVerticalListView extends StatelessWidget {
  const myVerticalListView(
      {Key? key, required this.Employeeimage, required this.EmployeeName})
      : super(key: key);
  final String Employeeimage, EmployeeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(Employeeimage),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          EmployeeName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF002046),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 34,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.only(left: 90),
                        child: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: Color(0xFF002046),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}