import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class EditData_emp extends StatefulWidget {
  final List list;
  final int index;
  EditData_emp({required this.list, required this.index});

  @override
  State<EditData_emp> createState() => _EditData_empState();
}

class _EditData_empState extends State<EditData_emp> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone_num = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController city = TextEditingController();

  EditData() {
    if (fname.text != "" &&
        lname.text != "" &&
        address.text != "" &&
        phone_num.text != "" &&
        city.text != "" &&
        salary.text != "") {
      var url = Uri.parse('http://10.7.25.24/game/editdata.php');
      http.post(url, body: {
        'emp_id': widget.list[widget.index]['emp_id'],
        'fname': fname.text,
        'lname': lname.text,
        'address': address.text,
        'phone_num': phone_num.text,
        'city': city.text,
        'salary': salary.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Update Successful!"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please Fill All Records!"),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      fname.text = widget.list[widget.index]['fname'];
      lname.text = widget.list[widget.index]['lname'];
      phone_num.text = widget.list[widget.index]['phone_num'];
      address.text = widget.list[widget.index]['address'];
      city.text = widget.list[widget.index]['city'];
      salary.text = widget.list[widget.index]['salary'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: fname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("First Name"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: lname,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Last Name"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: address,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Address"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: phone_num,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Phone Number"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: city,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("city"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: salary,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Salary"),
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
      ),
    );
  }
}
