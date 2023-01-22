// To parse this JSON data, do
//
//     final loginResponseData = loginResponseDataFromJson(jsonString);

import 'dart:convert';

LoginResponseData loginResponseDataFromJson(String str) =>
    LoginResponseData.fromJson(json.decode(str));

String loginResponseDataToJson(LoginResponseData data) =>
    json.encode(data.toJson());

class LoginResponseData {
  LoginResponseData({
    this.data,
    this.user,
  });

  Data? data;
  User? user;

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      LoginResponseData(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "user": user?.toJson(),
      };
}

class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

class User {
  User({
    this.id,
    this.employeeName,
    this.employeeNumber,
    this.dOJoining,
    this.email,
    this.emailIsVerified,
    this.emailVerifiedOn,
    this.altEmail,
    this.mobileNo,
    this.mobileIsVerified,
    this.mobileVerifiedOn,
    this.altMobileNo,
    this.password,
    this.address,
    this.addressIsVerified,
    this.addressVerifiedOn,
    this.role,
    this.bloodGroup,
    this.gender,
    this.nationality,
    this.dOB,
    this.profileUrl,
    this.companyId,
    this.designationId,
    this.branchId,
    this.employeeType,
    this.employeeStatus,
    this.lastLogin,
    this.createdRole,
    this.updatedRole,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? employeeName;
  String? employeeNumber;
  DateTime? dOJoining;
  String? email;
  String? emailIsVerified;
  dynamic emailVerifiedOn;
  dynamic altEmail;
  int? mobileNo;
  String? mobileIsVerified;
  dynamic mobileVerifiedOn;
  dynamic altMobileNo;
  String? password;
  String? address;
  String? addressIsVerified;
  dynamic addressVerifiedOn;
  int? role;
  String? bloodGroup;
  String? gender;
  String? nationality;
  DateTime? dOB;
  String? profileUrl;
  int? companyId;
  int? designationId;
  dynamic branchId;
  dynamic employeeType;
  String? employeeStatus;
  DateTime? lastLogin;
  dynamic createdRole;
  dynamic updatedRole;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeNumber: json["employee_number"],
        dOJoining: json["d_o_joining"] == null
            ? null
            : DateTime.parse(json["d_o_joining"]),
        email: json["email"],
        emailIsVerified: json["email_is_verified"],
        emailVerifiedOn: json["email_verified_on"],
        altEmail: json["alt_email"],
        mobileNo: json["mobile_no"],
        mobileIsVerified: json["mobile_is_verified"],
        mobileVerifiedOn: json["mobile_verified_on"],
        altMobileNo: json["alt_mobile_no"],
        password: json["password"],
        address: json["address"],
        addressIsVerified: json["address_is_verified"],
        addressVerifiedOn: json["address_verified_on"],
        role: json["role"],
        bloodGroup: json["blood_group"],
        gender: json["gender"],
        nationality: json["nationality"],
        dOB: json["d_o_b"] == null ? null : DateTime.parse(json["d_o_b"]),
        profileUrl: json["profile_url"],
        companyId: json["company_id"],
        designationId: json["designation_id"],
        branchId: json["branch_id"],
        employeeType: json["employee_type"],
        employeeStatus: json["employee_status"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        createdRole: json["created_role"],
        updatedRole: json["updated_role"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "employee_name": employeeName,
        "employee_number": employeeNumber,
        "d_o_joining":
            "${dOJoining!.year.toString().padLeft(4, '0')}-${dOJoining!.month.toString().padLeft(2, '0')}-${dOJoining!.day.toString().padLeft(2, '0')}",
        "email": email,
        "email_is_verified": emailIsVerified,
        "email_verified_on": emailVerifiedOn,
        "alt_email": altEmail,
        "mobile_no": mobileNo,
        "mobile_is_verified": mobileIsVerified,
        "mobile_verified_on": mobileVerifiedOn,
        "alt_mobile_no": altMobileNo,
        "password": password,
        "address": address,
        "address_is_verified": addressIsVerified,
        "address_verified_on": addressVerifiedOn,
        "role": role,
        "blood_group": bloodGroup,
        "gender": gender,
        "nationality": nationality,
        "d_o_b":
            "${dOB!.year.toString().padLeft(4, '0')}-${dOB!.month.toString().padLeft(2, '0')}-${dOB!.day.toString().padLeft(2, '0')}",
        "profile_url": profileUrl,
        "company_id": companyId,
        "designation_id": designationId,
        "branch_id": branchId,
        "employee_type": employeeType,
        "employee_status": employeeStatus,
        "last_login": lastLogin?.toIso8601String(),
        "created_role": createdRole,
        "updated_role": updatedRole,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
