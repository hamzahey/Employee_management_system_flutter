import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({required this.list, required this.index});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  // TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  EditData() {
    if (name.text != "" && phone.text != "") {
      var url = Uri.parse('http://10.7.25.24/myfolder/editdata.php');
      http.post(url, body: {
        'id': widget.list[widget.index]['id'],
        'name': name.text,
        'phone': phone.text,
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
      name.text = widget.list[widget.index]['name'];
      phone.text = widget.list[widget.index]['phone'];
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
