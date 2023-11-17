import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String altEmail;
  final String phone;
  final String sex;
  final Timestamp birthDate;
  final List<dynamic> favVolunteerings;
  String currVolunteering;

  UserModel({
    required this.id,
    required this.sex,
    required this.name,
    required this.lastname,
    required this.email,
    required this.altEmail,
    required this.phone,
    required this.birthDate,
    required this.favVolunteerings,
    required this.currVolunteering,
  });

  toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'email': email,
        'altEmail': altEmail,
        'phone': phone,
        'birthDate': birthDate,
        'currVolunteering': currVolunteering,
        'favVolunteerings': favVolunteerings,
        'sex': sex
      };

  factory UserModel.fromMap(Map<String, dynamic> map, String? id) {
    return UserModel(
      id: id ?? '',
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      altEmail: map['altEmail'],
      phone: map['phone'],
      birthDate: map['birthDate'],
      favVolunteerings: map['favVolunteerings'],
      currVolunteering: map['currVolunteering'],
      sex: map['sex'],
    );
  }
}
