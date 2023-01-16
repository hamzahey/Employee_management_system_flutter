import 'dart:convert';
import 'package:emp2/employee/details_emp.dart';
import 'package:emp2/employee/insert_emp.dart';
import 'package:emp2/insert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApi_emp extends StatefulWidget {
  const MyApi_emp({super.key});

  @override
  State<MyApi_emp> createState() => _MyApi_empState();
}

class _MyApi_empState extends State<MyApi_emp> {
  List item = [];

  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse("http://10.7.152.149/game/getdata.php"));
    return jsonDecode(result.body);
  }

  @override
  void initState() {
    var response = fetchUsers();
    super.initState();
  }

  myApiWidget() {
    return FutureBuilder(
      future: fetchUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          item = snapshot.data;
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("${item[index]['fname']}  ${item[index]['lname']}"),
                      subtitle: Text(item[index]['phone_num']),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Details_emp(list: item, index: index),
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
        title: Text("EMPLOYEE"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => InsertData_emp(),),);
        }),
        child: Icon(Icons.add),
      ),
      body: myApiWidget(),
    );;
  }
}
