import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model/user.dart';

class ReadData extends StatefulWidget {
  const ReadData({super.key});

  @override
  State<ReadData> createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  final formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerNim = TextEditingController();
  final controllerGender = TextEditingController();
  final controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Stream<List<User>> readUsers() => FirebaseFirestore.instance
        .collection('data_mhs')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

    return Scaffold(
      appBar: AppBar(title: const Text("List Data Mahasiswa")),
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addData');
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildUser(User user) => ListTile(
        leading: CircleAvatar(child: Text('${user.gender}')),
        title: Text(user.name),
        subtitle: Text(user.nim.toString()),
      );
}
