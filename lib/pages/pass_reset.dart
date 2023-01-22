import 'package:flutter/material.dart';

import '../components/color.dart';
import 'create_new_pass.dart';

class ResetPasswordScreen extends StatelessWidget {
  final _formKeys = GlobalKey<FormState>();

  final TextEditingController EmailAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: oxfordBlue,
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const CreateNewPass()),
            // );
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
              height: 50,
            ),
            Text(
              'Reset Password',
              style: TextStyle(
                  color: Color(0xFF1B383A),
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                style: TextStyle(
                    color: Color(0xFF1B383A),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: EmailAddress,
              decoration: InputDecoration(
                hintText: 'Registered Email Address',
                hintStyle: TextStyle(color: textSecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email Required';
                }
                return null;
              },

              // validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Employee Name Required';
              //     }
              //     return null;
              //   },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: oxfordBlue,
                onPrimary: Colors.white,
                // shadowColor: Colors.greenAccent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                minimumSize: Size(500, 45),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateNewPass()));
              },
              child: Text('Submit'),
            ),
            SizedBox(
              height: 320,
            ),
            Center(
              child: Text(
                "Copy Rights HR4U. All Rights Reserverd",
                textAlign: TextAlign.center,
                style: TextStyle(color: oxfordBlue, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
