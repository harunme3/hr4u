// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hr4u/utils/validators/my_validators.dart';
import 'package:hr4u/utils/widget_helpers/common_button.dart';
import 'package:intl/intl.dart';
import '../components/color.dart';
import '../api_models/addEmployeeModel.dart';
import '../utils.dart';
import 'employees_list.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

//
// dynamic passportFile;
// dynamic visaFile;
dynamic empProfileFile;
// dynamic passportFileEx;
// dynamic visaFileEx;
dynamic empProfileFileEx;

// dynamic brpdocument;
// dynamic brpdocumentEx;

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController employeeName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController bloodGroup = TextEditingController();
  final TextEditingController nationality = TextEditingController();
  final TextEditingController JoinDate = TextEditingController();

  bool enable = true;

  bool _pickImagePp = false;
  bool _pickImagePpSelect = false;
  bool _pickImageVisa = false;
  bool _pickImageVisaSelect = false;
  bool _pickImageEmpProfile = false;
  bool _pickImageEmpProfileSelect = false;
  bool _picImagerpdocument = false;
  bool _picImagerpdocumentSelect = false;
  ImagePicker picker = ImagePicker();

  String _permission = '';

//get gallery permission
  getGalleryPermission() async {
    var status = await Permission.photos.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.photos.request();
    }
    return status;
  }

//get camera permission
  getCameraPermission() async {
    var status = await Permission.camera.status;
    if (status != PermissionStatus.granted) {
      status = await Permission.camera.request();
    }
    return status;
  }

//pick image from gallery
  pickImageFromGallery(selectedType) async {
    // var permission = await getGalleryPermission();
    // if (permission == PermissionStatus.granted) {
    var allowEx = ['png', 'jpg', 'pdf', 'doc'];
    if (_pickImageEmpProfileSelect == true) {
      var allowEx = ['png', 'jpg'];
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: allowEx,
    );
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        // if (selectedType == 'PP') {
        //   passportFile = file.path;
        //   passportFileEx = file.extension;
        //   _pickImagePp = false;
        // }
        // if (selectedType == 'VISA') {
        //   visaFile = file.path;
        //   visaFileEx = file.extension;
        //   _pickImageVisa = false;
        // }
        if (selectedType == 'PROFILE') {
          empProfileFile = file.path;
          empProfileFileEx = file.extension;
          _pickImageEmpProfile = false;
        }

        // if (selectedType == 'BRP') {
        //   brpdocument = file.path;
        //   brpdocumentEx = file.extension;
        //   _pickImageEmpProfile = false;
        // }
      });
    }
  }

//pick image from camera
  pickImageFromCamera(selectedType) async {
    var permission = await getCameraPermission();
    if (permission == PermissionStatus.granted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      setState(() {
        // if (selectedType == 'PP') {
        //   passportFile = pickedFile?.path;
        //   passportFileEx = pickedFile?.mimeType;
        //   _pickImagePp = false;
        // }
        // if (selectedType == 'VISA') {
        //   visaFile = pickedFile?.path;
        //   visaFileEx = pickedFile?.mimeType;
        //   _pickImageVisa = false;
        // }
        if (selectedType == 'PROFILE') {
          empProfileFile = pickedFile?.path;
          empProfileFileEx = pickedFile?.mimeType;
          _pickImageEmpProfile = false;
        }
        // if (selectedType == '_picImagerpdocument') {
        //   brpdocument = pickedFile?.path;
        //   brpdocumentEx = pickedFile?.mimeType;
        //   _picImagerpdocument = false;
        // }
      });
    } else {
      setState(() {
        _permission = 'noCamera';
      });
    }
  }

  @override
  void initState() {
    // dob.text = "";
    // ped.text = "";
    // vsd.text = "";
    // ved.text = "";
    // passportFile = null;
    // visaFile = null;
    empProfileFile = null;
    // brpdocument = null;

    super.initState();
  }

  saveCollection() async {
    setState(() {
      enable = false;
    });
    if (_formKey.currentState!.validate()) {
      await ApiService.saveCollection(
        employeeName.text,
        email.text,
        mobileNo.text,
        password.text,
        dob.text,
        address.text,
        SelectGender,
        bloodGroup,
        nationality,
        JoinDate,
        selectedRole,
      );
      Utils.showSnackBar(context, 'Employee added successfully');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Employees_List()));
    }
  }

  String selectedRole = ("1");
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "1", child: Text("Employee")),
      const DropdownMenuItem(value: "2", child: Text("Manager")),
    ];
    return menuItems;
  }

  String SelectGender = ("Male");
  List<DropdownMenuItem<String>> get SelectGenderList {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Male", child: Text("male")),
      const DropdownMenuItem(value: "Female", child: Text("Female")),
      const DropdownMenuItem(value: "Others", child: Text("Female")),
    ];
    return menuItems;
  }

  // DROP DOWN
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
          'Add Employee',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: CommonButton(
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                saveCollection();
              }
            },
            buttonTitle: "Add Employee"),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),

                  empProfileFile != null
                      ? Center(
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: kPrimaryBlueColor,
                                width: 1.5,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              height: media.width * 0.25,
                              width: media.width * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffFFFFFF),
                                image: DecorationImage(
                                  image: (empProfileFileEx == 'pdf' ||
                                          empProfileFileEx == 'doc')
                                      ? const AssetImage(
                                              'assets/images/doc.png')
                                          as ImageProvider
                                      : FileImage(File(empProfileFile)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _pickImageVisa = false;
                              _pickImageVisaSelect = false;
                              _pickImagePp = false;
                              _pickImagePpSelect = false;
                              _pickImageEmpProfile = true;
                              _pickImageEmpProfileSelect = true;
                              _picImagerpdocument = false;
                              _picImagerpdocumentSelect = false;
                            });
                          },
                          child: Center(
                            child: Container(
                              height: media.width * 0.25,
                              width: media.width * 0.25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFFFFF),
                                border: Border.all(color: Colors.grey),
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/avatar_default.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Employee Image',
                      style: TextStyle(
                        color: kPrimaryBlueColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Name ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: employeeName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Employee Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validateFullName(
                          value ?? "", "Employee Name");
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Email ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: " Enter Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validateEmail(value);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text(
                      'Note: Email address will be the user Login ID',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Mobile Number  ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: mobileNo,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validateNumber(
                          value ?? "", "Mobile Number");
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Password  ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validatePassword(value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Confirm Password  ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: confirmPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Enter Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validateConfirmPassword(
                          value, password.text);
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "Date of Birth  ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: dob, //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: "Please Select Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
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

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          dob.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Text(
                    "Address  ",
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
                    minLines: 3,
                    controller: address,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Enter Employee Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    // validator: (value) {
                    //   return MyValidator.validateEmptyField(
                    //       value ?? "", "Employee Address");
                    // },
                  ),

                  // Dropdown menu Start
                  // const Text("Add Employee :"),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Gender ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      isExpanded: true,
                      value: SelectGender.toString(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      // style:
                      // TextStyle(color: MyColors.light_get_40),
                      onChanged: (String? data) {
                        setState(() {
                          SelectGender = data!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                        return null;
                      },
                      items: SelectGenderList),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Blood Group ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: bloodGroup,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Blood Group",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    // validator: (value) {
                    //   return MyValidator.validateEmptyField(
                    //       value ?? "", "Blood Group");
                    // },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Nationality ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: nationality,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Nationality",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                    validator: (value) {
                      return MyValidator.validateEmptyField(
                          value ?? "", "Nationality");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Date of Joining ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: JoinDate, //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: "Please Select Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(),
                      ),
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

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          JoinDate.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  // second

                  // Dropdown menu Start
                  const Text(
                    "Role  ",
                    style: TextStyle(
                      fontSize: 20,
                      color: oxfordBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      isExpanded: true,
                      value: selectedRole.toString(),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      // style:
                      // TextStyle(color: MyColors.light_get_40),
                      onChanged: (String? data) {
                        setState(() {
                          selectedRole = data!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Role.';
                        }
                        return null;
                      },
                      items: dropdownItems),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        (_pickImagePp == true ||
                _pickImageVisa == true ||
                _pickImageEmpProfile == true ||
                _picImagerpdocument)
            ? Positioned(
                bottom: 0,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (_pickImagePpSelect == true) {
                        _pickImagePp = false;
                      }
                      if (_pickImageVisaSelect == true) {
                        _pickImageVisa = false;
                      }
                      if (_pickImageEmpProfileSelect == true) {
                        _pickImageEmpProfile = false;
                      }
                      if (_picImagerpdocumentSelect == true) {
                        _picImagerpdocument = false;
                      }
                    });
                  },
                  child: Container(
                    height: media.height * 1,
                    width: media.width * 1,
                    color: Colors.transparent.withOpacity(0.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(media.width * 0.05),
                          width: media.width * 1,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              border: Border.all(
                                color: const Color(0xffE5E5E5),
                                width: 1.2,
                              ),
                              color: const Color(0xffFFFFFF)),
                          child: Column(
                            children: [
                              Container(
                                height: media.width * 0.02,
                                width: media.width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(media.width * 0.01),
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: media.width * 0.05,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (_pickImagePpSelect == true) {
                                            pickImageFromCamera('PP');
                                          }
                                          if (_pickImageVisaSelect == true) {
                                            pickImageFromCamera('VISA');
                                          }
                                          if (_pickImageEmpProfileSelect ==
                                              true) {
                                            pickImageFromCamera('PROFILE');
                                          }
                                          if (_picImagerpdocumentSelect ==
                                              true) {
                                            pickImageFromCamera('BRP');
                                          }
                                        },
                                        child: Container(
                                            height: media.width * 0.171,
                                            width: media.width * 0.171,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffE5E5E5),
                                                    width: 1.2),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              size: media.width * 0.064,
                                            )),
                                      ),
                                      SizedBox(
                                        height: media.width * 0.01,
                                      ),
                                      const Text(
                                        'camera',
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (_pickImagePpSelect == true) {
                                            pickImageFromGallery('PP');
                                          }
                                          if (_pickImageVisaSelect == true) {
                                            pickImageFromGallery('VISA');
                                          }
                                          if (_pickImageEmpProfileSelect ==
                                              true) {
                                            pickImageFromGallery('PROFILE');
                                          }
                                          if (_picImagerpdocumentSelect ==
                                              true) {
                                            pickImageFromGallery('BRP');
                                          }
                                        },
                                        child: Container(
                                            height: media.width * 0.171,
                                            width: media.width * 0.171,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        const Color(0xffE5E5E5),
                                                    width: 1.2),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Icon(
                                              Icons.image_outlined,
                                              size: media.width * 0.064,
                                            )),
                                      ),
                                      SizedBox(
                                        height: media.width * 0.01,
                                      ),
                                      const Text(
                                        'File',
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
            : Container(),
      ]),
    );
  }
}
