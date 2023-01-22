import 'package:flutter/material.dart';

import '../components/color.dart';
import 'Notification/NormalNofification/notification.dart';

class VatBill extends StatelessWidget {
  const VatBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: oxfordBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: white,
          ),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            'Add VAT Bill',
            style: TextStyle(color: white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 210),
              child: Text(
                'Description / Remark :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.network(
              'https://images.indianexpress.com/2016/11/jio-bill-480.jpg',
              width: 400,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 210),
              child: Text(
                'Description / Remark :',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 5,
              minLines: 3,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Enter Employee address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Employee Address Required ';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 220,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: oxfordBlue,
                onPrimary: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(500, 45),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const notification_page()));
              },
              child: const Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
