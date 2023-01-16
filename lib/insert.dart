import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class InsertData extends StatefulWidget {
  // final List list;
  // final int index;
  // InsertData({required this.list,required this.index});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  UpdateData() {
    if (id.text != "" && name.text != "" && phone.text != "") {
      var url = Uri.parse('http://10.7.25.24/myfolder/insertdata.php');
      http.post(url, body: {
        'id': id.text,
        'name': name.text,
        'phone': phone.text,
      });

      id.text = "";
      name.text = "";
      phone.text = "";

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Insertion Successful"),
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: id,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("ID"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Phone"),
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
