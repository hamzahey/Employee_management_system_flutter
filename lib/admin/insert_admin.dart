import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Insert_admin extends StatefulWidget {
  const Insert_admin({super.key});

  @override
  State<Insert_admin> createState() => _Insert_adminState();
}

class _Insert_adminState extends State<Insert_admin> {
  TextEditingController emp_id = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  UpdateData() {
    if (emp_id.text != "" && username.text != "" && password.text != "") {
      var url = Uri.parse('http://10.7.152.149/employee/insert_admin.php');
      http.post(url, body: {
        'emp_id': emp_id.text,
        'username': username.text,
        'password': password.text,
      });

      emp_id.text = "";
      username.text = "";
      password.text = "";
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please Fill All Records!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert Data"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: emp_id,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("EMP ID"),
              ),
            ),
          ),
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
                label: Text("Password"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                UpdateData();
              },
              child: Text("Insert"),
            ),
          )
        ],
      ),
    );
  }
}
