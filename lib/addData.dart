import 'package:flutter/material.dart';

class addData extends StatefulWidget {
  const addData({super.key});

  @override
  State<addData> createState() => _addDataState();
}

class _addDataState extends State<addData> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nim = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController phone_number = TextEditingController();

  _saveData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Data Mahasiswa")),
      body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: nim,
                  decoration: InputDecoration(
                    hintText: "Masukkan NIM",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "NIM Harus Diisi!";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: name,
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: gender,
                  decoration: InputDecoration(
                    hintText: "Masukkan Jenis Kelamin",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Jenis Kelamin Harus Diisi!";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: phone_number,
                  decoration: InputDecoration(
                    hintText: "Masukkan Nomor Telepon",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nomor Telepon Harus Diisi!";
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _saveData();
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
