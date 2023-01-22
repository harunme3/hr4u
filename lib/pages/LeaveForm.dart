import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/color.dart';

class LeaveManagement extends StatefulWidget {
  const LeaveManagement({Key? key}) : super(key: key);

  @override
  State<LeaveManagement> createState() => _LeaveManagementState();
}

class _LeaveManagementState extends State<LeaveManagement> {
  final TextEditingController formdate = TextEditingController();
  final TextEditingController Todate = TextEditingController();
  final TextEditingController Reason = TextEditingController();

  // Default Radio Button Selected Item When App Starts.
  String radioButtonFullday = 'FullDay';
  String radioButtonhalfday = 'FullDay';

  // Group Value for Radio Button.
  var id = 1;
  var ids = 2;

  // Group Value for Radio Button.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: oxfordBlue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Apply for Leave',
          style: TextStyle(color: white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            Form(child:ListView(
              children: [
                const Text(
                  "From Date ",
                  style: TextStyle(
                    fontSize: 20,
                    color: oxfordBlue,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: formdate, //editing controller of this TextField
                  decoration: InputDecoration(
                    hintText: "Please Select Date ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  readOnly: true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        formdate.text = formattedDate; //set output date to TextField value.
                      }
                      );
                    } else {}
                  },

                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonFullday = 'FullDay';
                      id = 1;
                    });
                  },
                ),
              Text(
                'Full Day',
                style: new TextStyle(fontSize: 17.0),
              ),
                    Radio(
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonhalfday = 'HalfDay';
                          id = 2;
                        });
                      },
                    ),
                    Text(
                      'Half Day',
                      style: new TextStyle(fontSize: 17.0),
                    ),

            ],),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "To Date ",
                  style: TextStyle(
                    fontSize: 20,
                    color: oxfordBlue,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: Todate, //editing controller of this TextField
                  decoration: InputDecoration(
                    hintText: "Please Select Date ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  readOnly: true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                      setState(() {
                        Todate.text = formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: ids,
                      onChanged: (val) {
                        setState(() {
                          radioButtonFullday = 'Full Day';
                          ids = 1;
                        });
                      },
                    ),
                    Text(
                      'Full Day',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    Radio(
                      value: 2,
                      groupValue: ids,
                      onChanged: (val) {
                        setState(() {
                          radioButtonhalfday = 'Half Day';
                          ids = 2;
                        }
                        );
                      },
                    ),
                    Text(
                      'Half Day',
                      style: new TextStyle(fontSize: 17.0),
                    ),

                  ],),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "Leave Reason  ",
                  style: TextStyle(
                    fontSize: 20,
                    color: oxfordBlue,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  maxLines: 5,
                  minLines: 5,
                  controller: Reason,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "Reason",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Reason Required ';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: oxfordBlue,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {

                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),

                      child: Text(
                        "Apply for Leave",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),

                    ),
                  ),
                )

              ],

            ),),
          ],
        ),
      ),
    );
  }
}
