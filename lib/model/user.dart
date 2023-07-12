// import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String? nim;
  String? phone_number;
  final String gender;

  User({
    this.id = '',
    required this.name,
    required this.nim,
    required this.phone_number,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nim': nim,
        'phone_number': phone_number,
        'gender': 'gender',
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        nim: json['nim'],
        phone_number: json['phone_number'],
        gender: json['gender'],
      );
}
