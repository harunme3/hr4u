// ignore_for_file: prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr4u/components/color.dart';
import 'package:hr4u/newpages/uploaddocument/tkshowimg.dart';
import 'package:hr4u/newpages/uploaddocument/toastdata.dart';
import 'package:hr4u/newpages/uploaddocument/uploaddocumentapi.dart';
import 'package:logger/logger.dart';

class UploadDocumentData extends StatefulWidget {
  const UploadDocumentData({super.key});

  @override
  State<UploadDocumentData> createState() => _UploadDocumentDataState();
}

class _UploadDocumentDataState extends State<UploadDocumentData> {
  late TextEditingController begindateController = TextEditingController();
  late TextEditingController dobController = TextEditingController();
  late TextEditingController documenttypeController = TextEditingController();
  String documenturl = '';
  late TextEditingController downloadableController = TextEditingController();
  final List<String> downloadablechoicellist = [
    'YES',
    'NO',
  ];

  late TextEditingController expiryController = TextEditingController();
  late double filesize;
  final List<String> identitytypelist = [
    'PASSPORT',
    'VISA',
    'SPOUSE_PROOF',
    'ADDRESS_PROOF',
    'BRP'
  ];

  bool isfetching = false;
  var l = Logger();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController numberController = TextEditingController();
  String? selecteddownloadabletype;
  String? selectedidentitytype;
  bool validatename = false;
  bool validatenumber = false;
  bool validatebegin = false;
  bool validateexpiry = false;
  bool validatedocumenttype = false;
  bool validatedownloadable = false;
  bool validatefileselected = true;

  selectfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png'],
        allowCompression: true);

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        filesize = file.size / 1000;
        l.w(filesize);
        documenturl = file.path!;
        validatefileselected = true;
      });
    } else {
      validatefileselected = false;
      l.w('canceled');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          'Upload Document',
          style: TextStyle(color: white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Name",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Enter Document Name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            errorText:
                                validatename ? 'Enter document name' : null,
                          ),
                          onChanged: (value) {
                            if (nameController.text.isNotEmpty) {
                              setState(() {
                                validatename = false;
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Number",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: TextField(
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "Enter Document Number",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            errorText:
                                validatenumber ? 'Enter document number' : null,
                          ),
                          onChanged: (value) {
                            if (numberController.text.isNotEmpty) {
                              setState(() {
                                validatenumber = false;
                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Begin Date",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: DateTimePicker(
                          controller: begindateController,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                            hintText: "Select Document Begin Date",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                              size: 24,
                            ),
                            errorText: validatebegin
                                ? 'Please select begin date'
                                : null,
                          ),
                          onChanged: (val) {
                            begindateController.text = val;

                            if (begindateController.text.isNotEmpty) {
                              setState(() {
                                validatebegin = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Expiry Date",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: DateTimePicker(
                          controller: expiryController,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          decoration: InputDecoration(
                            hintText: "Select Document Expiry Date",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            suffixIcon: Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                              size: 24,
                            ),
                            errorText: validateexpiry
                                ? 'Please select expiry date'
                                : null,
                          ),
                          onChanged: (val) {
                            expiryController.text = val;
                            if (expiryController.text.isNotEmpty) {
                              setState(() {
                                validateexpiry = false;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Document Type",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: DropdownButtonFormField2(
                          value: selectedidentitytype,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            errorText: validatedocumenttype
                                ? 'Please select Document type'
                                : null,
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Document Type',
                          ),
                          buttonHeight: size.width * 0.10,
                          buttonPadding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          items: identitytypelist
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) async {
                            setState(() {
                              selectedidentitytype = value!;
                              validatedocumenttype = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: AutoSizeText(
                          "Downloadable",
                          style: TextStyle(
                            color: oxfordBlue,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.15,
                        child: DropdownButtonFormField2(
                          value: selecteddownloadabletype,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            errorText: validatedownloadable
                                ? 'Please select downloadable type'
                                : null,
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Downloadable',
                          ),
                          buttonHeight: size.width * 0.10,
                          buttonPadding: const EdgeInsets.only(
                            left: 20,
                            right: 10,
                          ),
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          items: downloadablechoicellist
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) async {
                            setState(() {
                              selecteddownloadabletype = value!;
                              validatedownloadable = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  documenturl == ''
                      ? SizedBox()
                      : TKShowImg(
                          width: size.width,
                          horizontal: 16,
                          vertical: 8,
                          imgpath: documenturl,
                          ontap: () {
                            selectfile();
                          },
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),

                          // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        selectfile();
                      },
                      child: Text(
                        "SELECT FILE",
                        style: TextStyle(color: oxfordBlue),
                      ),
                    ),
                  ),
                ],
              ),
              validatefileselected == true
                  ? SizedBox()
                  : Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            4.0,
                          ),
                          child: Text(
                            "Please select file",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: size.width * 0.05,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: const StadiumBorder(),
                    backgroundColor: oxfordBlue,
                  ),
                  onPressed: isfetching == true
                      ? () {}
                      : () async {
                          if (nameController.text.isEmpty) {
                            setState(() {
                              validatename = true;
                            });
                            return;
                          }
                          if (numberController.text.isEmpty) {
                            setState(() {
                              validatenumber = true;
                            });
                            return;
                          }

                          if (begindateController.text.isEmpty) {
                            setState(() {
                              validatebegin = true;
                            });
                            return;
                          }

                          if (expiryController.text.isEmpty) {
                            setState(() {
                              validateexpiry = true;
                            });
                            return;
                          }

                          if (selectedidentitytype == null) {
                            ToastData.showToast(
                                context, "Document Type is Required");
                            setState(() {
                              validatedocumenttype = true;
                            });
                            return;
                          }

                          if (selecteddownloadabletype == null) {
                            setState(() {
                              validatedownloadable = true;
                            });
                            return;
                          }

                          if (documenturl == '') {
                            setState(() {
                              validatefileselected = false;
                            });
                            return;
                          }
                          if (filesize >= 5000) {
                            ToastData.showToast(context,
                                "upload smaller file size less than 500Kb");
                            return;
                          }

                          setState(() {
                            isfetching = true;
                          });
                          var response =
                              await UploadDocumentAPI.uploaddocumnets(
                            doc_name: nameController.text,
                            doc_number: numberController.text,
                            doc_downloadable: selecteddownloadabletype!,
                            doc_emp_id: "1",
                            doc_begin_date: begindateController.text,
                            doc_expiry: expiryController.text,
                            doc_type: selectedidentitytype!,
                            doc_url: documenturl,
                          );
                          if (response['status'] == true) {
                            setState(() {
                              isfetching = false;
                              nameController.clear();
                              numberController.clear();
                              begindateController.clear();
                              expiryController.clear();
                            });
                            ToastData.showToast(
                                context, "uploaded successfully");
                          } else {
                            setState(() {
                              isfetching = false;
                            });
                            ToastData.showToast(
                                context, "Failed to upload document");
                          }
                        },
                  child:
                      isfetching == true ? Text("Uploading") : Text("Upload"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
