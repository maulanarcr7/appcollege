import 'dart:convert';
import 'package:appcollege/AddData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _data = [];

  Future _getdata() async {
    try {
      final response = await http.get(Uri.parse(
          'http://192.168.16.254/college-app/appcollege/lib/api/read.php'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _data = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                title: Text(_data[index]['name']),
                subtitle: Text(_data[index]['nim']),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          "+",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AddData())));
        },
      ),
    );
  }
}
