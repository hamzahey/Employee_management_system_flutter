import 'dart:convert';
import 'package:emp2/insert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'insert.dart';
import 'details.dart';

class MyApi extends StatefulWidget {
  MyApi({Key? key}) : super(key: key);
  @override
  _MyApiState createState() => _MyApiState();
}

class _MyApiState extends State<MyApi> {
  List item = [];

  Future<List<dynamic>> fetchUsers() async {
    var result =
        await http.get(Uri.parse("http://10.7.25.24/myfolder/getdata.php"));
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
                      title: Text(item[index]['name']),
                      
                      subtitle: Text(item[index]['phone']),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Details(list: item, index: index),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => InsertData(),),);
        }),
        child: Icon(Icons.add),
      ),
      body: myApiWidget(),
    );
  }
}
