import 'package:emp2/admin/myapi_admin.dart';
import 'package:emp2/employee/myapi_emp.dart';
import 'package:emp2/login.dart';
import 'package:emp2/myapi.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'admin/details_admin.dart';
import 'admin/myapi_admin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApi",
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              trailing: Icon(Icons.admin_panel_settings),
              title: Text("Admin"),
              onTap: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyApi_admin()),
                );
              }),
            ),
            ListTile(
              trailing: Icon(Icons.note_outlined),
              title: Text("Attendece"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.note_add),
              title: Text("Complaints"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.school),
              title: Text("department"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.emoji_people),
              title: Text("Employee"),
              onTap: (() {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => MyApi_emp()),
                );
              }),
            ),
            ListTile(
              trailing: Icon(Icons.explore),
              title: Text("Experience"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.person),
              title: Text("Intern"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.leave_bags_at_home),
              title: Text("Leaves"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.person),
              title: Text("Superviser"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.work),
              title: Text("project"),
              onTap: (() {}),
            ),
            ListTile(
              trailing: Icon(Icons.car_rental),
              title: Text("transport"),
              onTap: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
