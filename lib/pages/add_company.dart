import 'package:flutter/material.dart';
import 'package:hr4u/api_models/addCompanyModels.dart';

import '../api_models/addEmployeeModel.dart';
import '../components/color.dart';
import '../utils.dart';

class addcompany extends StatefulWidget {
  const addcompany({Key? key}) : super(key: key);

  @override
  State<addcompany> createState() => _addcompanyState();
}

class _addcompanyState extends State<addcompany> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController companyname = TextEditingController();
  final TextEditingController companyemail = TextEditingController();
  final TextEditingController companymobileNo = TextEditingController();
  final TextEditingController companyaddress = TextEditingController();
  final TextEditingController companycity = TextEditingController();
  final TextEditingController companypincode = TextEditingController();

  //loading
  bool enable = true;

  savacompany() async {
    setState(() {
      enable = false;
    });
    print(companyname.text);
    if (_formKey.currentState!.validate()) {
      await CompayModels.savacompany(
          companyname.text,
          companyemail.text,
          companymobileNo.text,
          companyaddress.text,
          companycity.text,
          companypincode.text);
      Utils.showSnackBar(context, 'Company added successfully');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: oxfordBlue,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text(
            'Add Company',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Company Name :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companyname,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company Name Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Company Email :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companyemail,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company email Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Company Number :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companymobileNo,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company  number Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Company Address :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companyaddress,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company Address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company Address Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter Company City :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companycity,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company City",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company city Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Enter Company Zipcode :",
                      style: TextStyle(
                        fontSize: 20,
                        color: oxfordBlue,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: companypincode,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter Company Zipcode",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company zipcode Required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: oxfordBlue,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        onPressed: () {
                          savacompany();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Add Company",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
