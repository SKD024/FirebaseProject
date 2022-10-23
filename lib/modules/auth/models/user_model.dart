import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  int? id;
  String? fId;
  String fullName;
  String email;
  String address;
  String phoneNumber;
  int age;
  bool status;
  String gender;
  DateTime? dob;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    this.id,
    this.fId,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.age,
    this.status = true,
    required this.gender,
    this.dob,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromDatabase(
    Map<String, dynamic> data,
  ) {
    return UserModel(
      id: data['id'],
      fId: data['fId'],
      fullName: data['fullName'],
      email: data['email'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
      age: data['age'],
      status: data['status'] == 1,
      gender: data['gender'],
      dob: (data['dob'] as Timestamp).toDate(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toDatabase() {
    Map<String, dynamic> dataMap = {
      'fullName': fullName,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
      'age': age,
      'status': status ? 1 : 0,
      'gender': gender,
      'dob': dob,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
    if (id != null) {
      dataMap['id'] = id;
    }
    if (fId != null) {
      dataMap['fId'] = fId;
    }
    return dataMap;
  }
}
