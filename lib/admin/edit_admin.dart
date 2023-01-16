import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Edit_admin extends StatefulWidget {
  final List list_admin;
  final int index_admin;
  Edit_admin({required this.list_admin, required this.index_admin});

  @override
  State<Edit_admin> createState() => _Edit_adminState();
}

class _Edit_adminState extends State<Edit_admin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  EditData() {
    if (username.text != "" && password.text != "") {
      var url = Uri.parse('http://10.7.152.149/employee/edit_admin.php');
      http.post(url, body: {
        'emp_id': widget.list_admin[widget.index_admin]['emp_id'],
        'username': username.text,
        'password': password.text,
      });
    } else {
      SnackBar(
        content: Text("Please Fill All Records!"),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index_admin != null) {
      username.text = widget.list_admin[widget.index_admin]['username'];
      password.text = widget.list_admin[widget.index_admin]['password'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Username"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("password"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                EditData();
              },
              child: Text("Edit"),
            ),
          )
        ],
      ),
    );
  }
}
