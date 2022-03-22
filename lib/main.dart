import 'dart:async';
import 'dart:convert';

import 'package:contacts/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  Future getUserData() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData){
      User user = User(u["name"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading.....'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index){
                return ListTile(
                  title: Text(snapshot.data?.name),
                );
                  });
              }
            },
          ),
        ),
      ),
    );
  }
}

