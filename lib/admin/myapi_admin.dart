import 'dart:convert';
import 'package:emp2/admin/details_admin.dart';
import 'package:emp2/admin/insert_admin.dart';
import 'package:emp2/insert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApi_admin extends StatefulWidget {
  const MyApi_admin({super.key});
  @override
  State<MyApi_admin> createState() => _MyApi_adminState();
}

class _MyApi_adminState extends State<MyApi_admin> {
  List item_admin = [];

  Future<List<dynamic>> fetchadmin() async {
    var result =
        await http.get(Uri.parse("http://10.7.152.149/employee/get_admin.php"));
    return jsonDecode(result.body);
  }

  @override
  void initState() {
    var response_admin = fetchadmin();
    super.initState();
  }

  myApiWidget_admin() {
    return FutureBuilder(
      future: fetchadmin(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          item_admin = snapshot.data;
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item_admin[index]['username'],
                      ),
                      subtitle: Text(
                        item_admin[index]['password'],
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Details_admin(
                              list_admin: item_admin, index_admin: index),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Insert_admin(),
            ),
          );
        }),
        child: Icon(Icons.add),
      ),
      body: myApiWidget_admin(),
    );
  }
}
