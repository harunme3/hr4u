import 'package:flutter/material.dart';
import 'package:hr4u/pages/pass_reset.dart';

import '../components/color.dart';
import 'attendance_report.dart';

class CreateNewPass extends StatefulWidget {
  const CreateNewPass({Key? key}) : super(key: key);

  @override
  State<CreateNewPass> createState() => _CreateNewPassState();
}

class _CreateNewPassState extends State<CreateNewPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: oxfordBlue,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPasswordScreen()),
            );
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: oxfordBlue),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'Create New password',
              style: TextStyle(
                  color: Color(0xFF1B383A),
                  fontSize: 28,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Your Password must be different form previous used passwords.'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Create New Password",
                  hintStyle: TextStyle(color: textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(),
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: textSecondary),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: oxfordBlue,
                  onPrimary: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(500, 45),
                ),
                onPressed: () {
                  // Within the SecondRoute widget
// onPressed: () {
//   Navigator.pop(context);
// };
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => attendancereport()));
                },
                child: Text('Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
