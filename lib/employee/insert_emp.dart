import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class InsertData_emp extends StatefulWidget {
  const InsertData_emp({super.key});

  @override
  State<InsertData_emp> createState() => _InsertData_empState();
}

class _InsertData_empState extends State<InsertData_emp> {
  TextEditingController emp_id = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone_num = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController city = TextEditingController();

  UpdateData() {
    if (emp_id.text != "" &&
        fname.text != "" &&
        lname.text != "" &&
        address.text != "" &&
        phone_num.text != "" &&
        city.text != "" &&
        salary.text != "") {
      var url = Uri.parse('http://10.7.152.149/game/insertdata.php');
      http.post(url, body: {
        'emp_id': emp_id.text,
        'fname': fname.text,
        'lname': lname.text,
        'address': address.text,
        'phone_num': phone_num.text,
        'city': city.text,
        'salary': salary.text,
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Insertion Successful!"),
      ));
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: emp_id,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Employee ID"),
                ),
              ),
            ),
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
                  UpdateData();
                },
                child: Text("Insert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
