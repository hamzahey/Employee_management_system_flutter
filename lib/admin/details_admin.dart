import 'package:emp2/admin/edit_admin.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details_admin extends StatefulWidget {
  List list_admin;
  int index_admin;
  Details_admin({required this.list_admin, required this.index_admin});

  @override
  State<Details_admin> createState() => _Details_adminState();
}

class _Details_adminState extends State<Details_admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.list_admin[widget.index_admin]["username"]}"),
        ),
        body: Container(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Employee ID: ",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.list_admin[widget.index_admin]["emp_id"],
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Username: ",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.list_admin[widget.index_admin]["username"],
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Password: ",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.list_admin[widget.index_admin]["password"],
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 40,
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.blue,
                      onPressed: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Edit_admin(
                              list_admin: widget.list_admin,
                              index_admin: widget.index_admin,
                            ),
                          ),
                        );
                      }),
                    ),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    // MaterialButton(
                    //   height: 40,
                    //   child: Text(
                    //     "Delete",
                    //     style: TextStyle(color: Colors.white, fontSize: 20),
                    //   ),
                    //   color: Colors.blue,
                    //   onPressed: () {
                    //     var url = Uri.parse(
                    //         'http://10.7.25.24/employee/delete_admin.php');
                    //     http.post(url, body: {
                    //       'emp_id': widget.list_admin[widget.index_admin]
                    //           ['emp_id'],
                    //     });
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
