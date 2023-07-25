import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerNim = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future createUser(User user) async {
      final docUser = FirebaseFirestore.instance.collection('data_mhs').doc();
      user.id = docUser.id;

      final json = user.toJson();
      await docUser.set(json);
    }

    return Scaffold(
      appBar: AppBar(title: Text("Detail Data Mahasiswa")),
      body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: controllerNim,
                  decoration: InputDecoration(
                    hintText: "Masukkan NIM",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "NIM Harus Diisi!";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerName,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nama Lengkap",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama Lengkap Harus Diisi!";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerGender,
                  decoration: InputDecoration(
                    hintText: "Masukkan Jenis Kelamin (L/P)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Jenis Kelamin Harus Diisi!";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controllerPhoneNumber,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nomor Telepon",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nomor Telepon Harus Diisi!";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final user = User(
                        gender: controllerGender.text,
                        name: controllerName.text,
                        nim: controllerNim.text,
                        phone_number: controllerPhoneNumber.text,
                      );
                      createUser(user);
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Save"),
                )
              ],
            ),
          )),
    );
  }
}

class User {
  String id;
  final String name;
  final String? nim;
  final String gender;
  final String? phone_number;

  User({
    this.id = '',
    required this.name,
    required this.nim,
    required this.gender,
    required this.phone_number,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'gender': gender,
        'name': name,
        'nim': nim,
        'phone_number': phone_number,
      };
}
