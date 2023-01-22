// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../components/color.dart';
// import '../api_models/addEmployeeModel.dart';
// import '../utils.dart';
// import 'employees_list.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:image_picker/image_picker.dart';
//
// class AddEmployeePage extends StatefulWidget {
//   const AddEmployeePage({Key? key}) : super(key: key);
//
//   @override
//   State<AddEmployeePage> createState() => _AddEmployeePageState();
// }
//
// // dynamic passportFile;
// // dynamic visaFile;
// // dynamic empProfileFile;
// dynamic passportFile;
// dynamic visaFile;
// dynamic empProfileFile;
// dynamic passportFileEx;
// dynamic visaFileEx;
// dynamic empProfileFileEx;
//
// dynamic brpdocument;
// dynamic brpdocumentEx;
//
// class _AddEmployeePageState extends State<AddEmployeePage> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController employeeName = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController mobileNo = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   final TextEditingController confirmPassword = TextEditingController();
//   final TextEditingController bloodGroup = TextEditingController();
//   final TextEditingController emgContactNo = TextEditingController();
//   final TextEditingController nationality = TextEditingController();
//   final TextEditingController passportNo = TextEditingController();
//   final TextEditingController address = TextEditingController();
//   final TextEditingController dob = TextEditingController();
//   final TextEditingController ped = TextEditingController();
//   final TextEditingController vsd = TextEditingController();
//   final TextEditingController ved = TextEditingController();
//   final TextEditingController visanum = TextEditingController();
//   final TextEditingController brpnum = TextEditingController();
//   final TextEditingController brpexdate = TextEditingController();
//
//   bool enable = true;
//   bool _pickImagePp = false;
//   bool _pickImagePpSelect = false;
//   bool _pickImageVisa = false;
//   bool _pickImageVisaSelect = false;
//   bool _pickImageEmpProfile = false;
//   bool _pickImageEmpProfileSelect = false;
//   bool _picImagerpdocument = false;
//   bool _picImagerpdocumentSelect = false;
//   ImagePicker picker = ImagePicker();
//
//   String _permission = '';
//
// //get gallery permission
//   getGalleryPermission() async {
//     var status = await Permission.photos.status;
//     if (status != PermissionStatus.granted) {
//       status = await Permission.photos.request();
//     }
//     return status;
//   }
//
// //get camera permission
//   getCameraPermission() async {
//     var status = await Permission.camera.status;
//     if (status != PermissionStatus.granted) {
//       status = await Permission.camera.request();
//     }
//     return status;
//   }
//
// //pick image from gallery
//   pickImageFromGallery(selectedType) async {
//     // var permission = await getGalleryPermission();
//     // if (permission == PermissionStatus.granted) {
//     var allowEx = ['png', 'jpg', 'pdf', 'doc'];
//     if (_pickImageEmpProfileSelect == true) {
//       var allowEx = ['png', 'jpg'];
//     }
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: allowEx,
//     );
//     if (result != null) {
//       PlatformFile file = result.files.first;
//       setState(() {
//         if (selectedType == 'PP') {
//           passportFile = file.path;
//           passportFileEx = file.extension;
//           _pickImagePp = false;
//         }
//         if (selectedType == 'VISA') {
//           visaFile = file.path;
//           visaFileEx = file.extension;
//           _pickImageVisa = false;
//         }
//         if (selectedType == 'PROFILE') {
//           empProfileFile = file.path;
//           empProfileFileEx = file.extension;
//           _pickImageEmpProfile = false;
//         }
//
//         if (selectedType == 'BRP') {
//           brpdocument = file.path;
//           brpdocumentEx = file.extension;
//           _pickImageEmpProfile = false;
//         }
//       });
//     }
//   }
//
// //pick image from camera
//   pickImageFromCamera(selectedType) async {
//     var permission = await getCameraPermission();
//     if (permission == PermissionStatus.granted) {
//       final pickedFile = await picker.pickImage(source: ImageSource.camera);
//       setState(() {
//         if (selectedType == 'PP') {
//           passportFile = pickedFile?.path;
//           passportFileEx = pickedFile?.mimeType;
//           _pickImagePp = false;
//         }
//         if (selectedType == 'VISA') {
//           visaFile = pickedFile?.path;
//           visaFileEx = pickedFile?.mimeType;
//           _pickImageVisa = false;
//         }
//         if (selectedType == 'PROFILE') {
//           empProfileFile = pickedFile?.path;
//           empProfileFileEx = pickedFile?.mimeType;
//           _pickImageEmpProfile = false;
//         }
//         if (selectedType == '_picImagerpdocument') {
//           brpdocument = pickedFile?.path;
//           brpdocumentEx = pickedFile?.mimeType;
//           _picImagerpdocument = false;
//         }
//       });
//     } else {
//       setState(() {
//         _permission = 'noCamera';
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     dob.text = "";
//     ped.text = "";
//     vsd.text = "";
//     ved.text = "";
//     passportFile = null;
//     visaFile = null;
//     empProfileFile = null;
//     brpdocument = null;
//
//     super.initState();
//   }
//
//   saveCollection() async {
//     setState(() {
//       enable = false;
//     });
//     if (_formKey.currentState!.validate()) {
//       await ApiService.saveCollection(
//         employeeName.text,
//         email.text,
//         mobileNo.text,
//         password.text,
//         dob.text,
//         address.text,
//         SelectGender,
//         bloodGroup,
//         nationality,
//         JoinDate,
//         selectedRole,
//       );
//       Utils.showSnackBar(context, 'Employee added successfully');
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => const Employees_List()));
//     }
//   }
//
//   List<DropdownMenuItem<String>> get dropdownItems {
//     List<DropdownMenuItem<String>> menuItems = [
//       const DropdownMenuItem(value: "1", child: Text("Employee")),
//       const DropdownMenuItem(value: "2", child: Text("Manager")),
//     ];
//     return menuItems;
//   }
//
//   String selectedRole = ("1");
//
//   // DROP DOWN
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: oxfordBlue,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_outlined),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Add Employee',
//           style: TextStyle(
//             fontSize: 25,
//           ),
//         ),
//       ),
//       body: Stack(children: [
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Name ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: employeeName,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: "Enter Employee Name",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Your Passport no Required';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Email ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: email,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: " Enter Email Address",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Email Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//                   child: Text(
//                     'Note: Email address will be the user Login ID',
//                     style: TextStyle(
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Mobile Number  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: mobileNo,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Enter Mobile Number",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Mobile Number Required';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Password  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: password,
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                     hintText: "Enter Password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Confirm Password  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: confirmPassword,
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                   enableSuggestions: false,
//                   autocorrect: false,
//                   decoration: InputDecoration(
//                     hintText: "Enter Confirm Password",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 const Text(
//                   "Passport Number ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: passportNo,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Enter Passport Number",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Your Passport no Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Passport Expiry Date  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                   controller: ped, //editing controller of this TextField
//                   decoration: InputDecoration(
//                     hintText: "Please Select Date ",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   readOnly:
//                   true, //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(
//                             2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//
//                       setState(() {
//                         ped.text =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {}
//                   },
//                 ),
//
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "VISA Number  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: visanum,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Enter VISA Number",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'VISA Number Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Visa start Date  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                   controller: vsd, //editing controller of this TextField
//                   decoration: InputDecoration(
//                     hintText: "Please Select Date",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   readOnly:
//                   true, //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(
//                             2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//
//                       setState(() {
//                         vsd.text =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {}
//                   },
//                 ),
// // Date Picker
//
// // date Picker
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Visa End Date  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                   controller: ved, //editing controller of this TextField
//                   decoration: InputDecoration(
//                     hintText: "Please Select Date",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   readOnly:
//                   true, //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(
//                             2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//
//                       setState(() {
//                         ved.text =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {}
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "BRP Number  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: brpnum,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Enter BRP Number",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Mobile BRP Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "BRP Expiry Date  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                   controller: brpexdate, //editing controller of this TextField
//                   decoration: InputDecoration(
//                     hintText: "Please Select Date",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   readOnly:
//                   true, //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(
//                             2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//
//                       setState(() {
//                         brpexdate.text =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {}
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 const Text(
//                   "Date of Birth  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                   controller: dob, //editing controller of this TextField
//                   decoration: InputDecoration(
//                     hintText: "Please Select Date",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   readOnly:
//                   true, //set it true, so that user will not able to edit text
//                   onTap: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                         context: context,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(
//                             2000), //DateTime.now() - not to allow to choose before today.
//                         lastDate: DateTime(2101));
//
//                     if (pickedDate != null) {
//                       String formattedDate =
//                       DateFormat('yyyy-MM-dd').format(pickedDate);
//
//                       setState(() {
//                         dob.text =
//                             formattedDate; //set output date to TextField value.
//                       });
//                     } else {}
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 const Text(
//                   "Address  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   maxLines: 5,
//                   minLines: 3,
//                   controller: address,
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     hintText: "Enter Employee Address",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Employee Address Required ';
//                     }
//                     return null;
//                   },
//                 ),
//
//                 // Dropdown menu Start
//                 // const Text("Add Employee :"),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 // second
//
//                 // Dropdown menu Start
//                 const Text(
//                   "Role  ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                         borderSide: const BorderSide(),
//                       ),
//                     ),
//                     isExpanded: true,
//                     value: selectedRole.toString(),
//                     icon: const Icon(Icons.arrow_drop_down),
//                     iconSize: 24,
//                     // style:
//                     // TextStyle(color: MyColors.light_get_40),
//                     onChanged: (String? data) {
//                       setState(() {
//                         selectedRole = data!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null) {
//                         return 'Please select gender.';
//                       }
//                       return null;
//                     },
//                     items: dropdownItems),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Blood Group ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: bloodGroup,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: "Enter Blood Group",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Your Blood Group  Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Emergency Contact ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: emgContactNo,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: "Enter Emergency Contact no",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Emergency contact no  Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   "Nationality ",
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: oxfordBlue,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextFormField(
//                   controller: nationality,
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(
//                     hintText: "Enter Nationality",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'your nationality   Required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: oxfordBlue,
//                         backgroundColor: filebg,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32.0)),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _pickImagePp = true;
//                           _pickImagePpSelect = true;
//                           _pickImageVisa = false;
//                           _pickImageVisaSelect = false;
//                           _pickImageEmpProfile = false;
//                           _pickImageEmpProfileSelect = false;
//                           _picImagerpdocument = false;
//                           _picImagerpdocumentSelect = false;
//                         });
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Text(
//                           "Upload Passport",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                     passportFile != null
//                         ? Container(
//                       height: media.width * 0.2,
//                       width: media.width * 0.2,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xffFFFFFF),
//                           image: DecorationImage(
//                               image: (passportFileEx == 'pdf' ||
//                                   passportFileEx == 'doc')
//                                   ? const AssetImage(
//                                   'assets/images/doc.png')
//                               as ImageProvider
//                                   : FileImage(File(passportFile)),
//                               fit: BoxFit.cover)),
//                     )
//                         : Container(),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: oxfordBlue,
//                         backgroundColor: filebg,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32.0)),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _pickImagePp = false;
//                           _pickImagePpSelect = false;
//                           _pickImageVisa = false;
//                           _pickImageVisaSelect = false;
//                           _pickImageEmpProfile = false;
//                           _pickImageEmpProfileSelect = false;
//                           _picImagerpdocument = true;
//                           _picImagerpdocumentSelect = true;
//                         });
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Text(
//                           "BRP Document",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // brpdocument != null ?   Container(
//                     //   height: media.width * 0.2,
//                     //   width: media.width * 0.2,
//                     //   decoration: BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: const Color(0xffFFFFFF),
//                     //       image: DecorationImage(
//                     //           image: FileImage(File(brpdocument)),
//                     //           fit: BoxFit.cover)),
//                     // ): Container(),
//
//                     brpdocument != null
//                         ? Container(
//                       height: media.width * 0.2,
//                       width: media.width * 0.2,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xffFFFFFF),
//                           image: DecorationImage(
//                               image: (brpdocumentEx == 'pdf' ||
//                                   brpdocumentEx == 'doc')
//                                   ? const AssetImage(
//                                   'assets/images/doc.png')
//                               as ImageProvider
//                                   : FileImage(File(brpdocument)),
//                               fit: BoxFit.cover)),
//                     )
//                         : Container(),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: oxfordBlue,
//                         backgroundColor: filebg,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32.0)),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _pickImageVisa = true;
//                           _pickImageVisaSelect = true;
//                           _pickImagePp = false;
//                           _pickImagePpSelect = false;
//                           _pickImageEmpProfile = false;
//                           _pickImageEmpProfileSelect = false;
//                           _picImagerpdocument = false;
//                           _picImagerpdocumentSelect = false;
//                         });
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Text(
//                           "Upload Visa",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     // visaFile != null ?   Container(
//                     //   height: media.width * 0.2,
//                     //   width: media.width * 0.2,
//                     //   decoration: BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: const Color(0xffFFFFFF),
//                     //       image: DecorationImage(
//                     //           image: FileImage(File(visaFile)),
//                     //           fit: BoxFit.cover)),
//                     // ): Container(),
//                     visaFile != null
//                         ? Container(
//                       height: media.width * 0.2,
//                       width: media.width * 0.2,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xffFFFFFF),
//                           image: DecorationImage(
//                               image: (visaFileEx == 'pdf' ||
//                                   visaFileEx == 'doc')
//                                   ? const AssetImage(
//                                   'assets/images/doc.png')
//                               as ImageProvider
//                                   : FileImage(File(visaFile)),
//                               fit: BoxFit.cover)),
//                     )
//                         : Container(),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: oxfordBlue,
//                         backgroundColor: filebg,
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(32.0)),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _pickImageVisa = false;
//                           _pickImageVisaSelect = false;
//                           _pickImagePp = false;
//                           _pickImagePpSelect = false;
//                           _pickImageEmpProfile = true;
//                           _pickImageEmpProfileSelect = true;
//                           _picImagerpdocument = false;
//                           _picImagerpdocumentSelect = false;
//                         });
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(10.0),
//                         child: Text(
//                           "Upload Profile Pic",
//                           style: TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // empProfileFile != null ? Container(
//                     //   height: media.width * 0.2,
//                     //   width: media.width * 0.2,
//                     //   decoration: BoxDecoration(
//                     //       shape: BoxShape.circle,
//                     //       color: const Color(0xffFFFFFF),
//                     //       image: DecorationImage(
//                     //           image: FileImage(File(empProfileFile)),
//                     //           fit: BoxFit.cover)),
//                     // ): Container(),
//                     empProfileFile != null
//                         ? Container(
//                       height: media.width * 0.2,
//                       width: media.width * 0.2,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xffFFFFFF),
//                           image: DecorationImage(
//                               image: (empProfileFileEx == 'pdf' ||
//                                   empProfileFileEx == 'doc')
//                                   ? const AssetImage(
//                                   'assets/images/doc.png')
//                               as ImageProvider
//                                   : FileImage(File(empProfileFile)),
//                               fit: BoxFit.cover)),
//                     )
//                         : Container(),
//                   ],
//                 ),
// // Date Picker
//
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 SizedBox(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white,
//                       backgroundColor: oxfordBlue,
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(32.0)),
//                     ),
//                     onPressed: () {
//                       saveCollection();
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Text(
//                         "Add Employee",
//                         style: TextStyle(
//                           fontSize: 22,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         (_pickImagePp == true ||
//             _pickImageVisa == true ||
//             _pickImageEmpProfile == true ||
//             _picImagerpdocument)
//             ? Positioned(
//             bottom: 0,
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   if (_pickImagePpSelect == true) {
//                     _pickImagePp = false;
//                   }
//                   if (_pickImageVisaSelect == true) {
//                     _pickImageVisa = false;
//                   }
//                   if (_pickImageEmpProfileSelect == true) {
//                     _pickImageEmpProfile = false;
//                   }
//                   if (_picImagerpdocumentSelect == true) {
//                     _picImagerpdocument = false;
//                   }
//                 });
//               },
//               child: Container(
//                 height: media.height * 1,
//                 width: media.width * 1,
//                 color: Colors.transparent.withOpacity(0.6),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(media.width * 0.05),
//                       width: media.width * 1,
//                       decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(25),
//                               topRight: Radius.circular(25)),
//                           border: Border.all(
//                             color: const Color(0xffE5E5E5),
//                             width: 1.2,
//                           ),
//                           color: const Color(0xffFFFFFF)),
//                       child: Column(
//                         children: [
//                           Container(
//                             height: media.width * 0.02,
//                             width: media.width * 0.15,
//                             decoration: BoxDecoration(
//                               borderRadius:
//                               BorderRadius.circular(media.width * 0.01),
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(
//                             height: media.width * 0.05,
//                           ),
//                           Row(
//                             mainAxisAlignment:
//                             MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Column(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       if (_pickImagePpSelect == true) {
//                                         pickImageFromCamera('PP');
//                                       }
//                                       if (_pickImageVisaSelect == true) {
//                                         pickImageFromCamera('VISA');
//                                       }
//                                       if (_pickImageEmpProfileSelect ==
//                                           true) {
//                                         pickImageFromCamera('PROFILE');
//                                       }
//                                       if (_picImagerpdocumentSelect ==
//                                           true) {
//                                         pickImageFromCamera('BRP');
//                                       }
//                                     },
//                                     child: Container(
//                                         height: media.width * 0.171,
//                                         width: media.width * 0.171,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color:
//                                                 const Color(0xffE5E5E5),
//                                                 width: 1.2),
//                                             borderRadius:
//                                             BorderRadius.circular(12)),
//                                         child: Icon(
//                                           Icons.camera_alt_outlined,
//                                           size: media.width * 0.064,
//                                         )),
//                                   ),
//                                   SizedBox(
//                                     height: media.width * 0.01,
//                                   ),
//                                   const Text(
//                                     'camera',
//                                   )
//                                 ],
//                               ),
//                               Column(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       if (_pickImagePpSelect == true) {
//                                         pickImageFromGallery('PP');
//                                       }
//                                       if (_pickImageVisaSelect == true) {
//                                         pickImageFromGallery('VISA');
//                                       }
//                                       if (_pickImageEmpProfileSelect ==
//                                           true) {
//                                         pickImageFromGallery('PROFILE');
//                                       }
//                                       if (_picImagerpdocumentSelect ==
//                                           true) {
//                                         pickImageFromGallery('BRP');
//                                       }
//                                     },
//                                     child: Container(
//                                         height: media.width * 0.171,
//                                         width: media.width * 0.171,
//                                         decoration: BoxDecoration(
//                                             border: Border.all(
//                                                 color:
//                                                 const Color(0xffE5E5E5),
//                                                 width: 1.2),
//                                             borderRadius:
//                                             BorderRadius.circular(12)),
//                                         child: Icon(
//                                           Icons.image_outlined,
//                                           size: media.width * 0.064,
//                                         )
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: media.width * 0.01,
//                                   ),
//                                   const Text(
//                                     'File',
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ))
//             : Container(),
//       ]),
//     );
//   }
// }
