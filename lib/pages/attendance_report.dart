import 'package:flutter/material.dart';

import '../components/color.dart';
import 'add_vat_bill.dart';

class attendancereport extends StatefulWidget {
  const attendancereport({Key? key}) : super(key: key);

  @override
  State<attendancereport> createState() => _attendancereportState();
}

class _attendancereportState extends State<attendancereport> {
  TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: oxfordBlue,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: oxfordBlue),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: litecol,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Icon(
                      Icons.info,
                      color: oxfordBlue,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Note Select Date Range Maximum of 3 Months.",
                        style: TextStyle(
                          color: oxfordBlue,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "From Date :",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: SingleChildScrollView(
                  child: Form(
                    child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          // icon: Icon(Icons.calendar_today), //icon of text field
                          hintText: "Select From Date" //label text of field
                          ),
                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        // if (pickedDate != null) {
                        //   print(
                        //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        //   String formattedDate =
                        //       DateFormat('yyyy-MM-dd').format(pickedDate);
                        //   print(
                        //       formattedDate); //formatted date output using intl package =>  2021-03-16
                        //   //you can implement different kind of Date Format here according to your requirement

                        //   setState(() {
                        //     dateinput.text =
                        //         formattedDate; //set output date to TextField value.
                        //   });
                        // } else {
                        //   print("Date is not selected");
                        // }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "From Date :",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: dateinput, //editing controller of this TextField
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // icon: Icon(Icons.calendar_today), //icon of text field
                    hintText: "Select To Date" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  // if (pickedDate != null) {
                  //   print(
                  //       pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  //   String formattedDate =
                  //       DateFormat('yyyy-MM-dd').format(pickedDate);
                  //   print(
                  //       formattedDate); //formatted date output using intl package =>  2021-03-16
                  //   //you can implement different kind of Date Format here according to your requirement

                  //   setState(() {
                  //     dateinput.text =
                  //         formattedDate; //set output date to TextField value.
                  //   });
                  // } else {
                  //   print("Date is not selected");
                  // }
                },
              ),
              const SizedBox(
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
                    minimumSize: const Size(500, 45),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const VatBill()));
                  },
                  child: const Text('Download PDF'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
