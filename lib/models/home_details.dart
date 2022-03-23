import 'package:contacts/models/post.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  final Post post;

  const HomeDetails({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email : '+post.email),
            Text('Id : '+post.id.toString()),
            Text('Phone : '+post.phone),
            Text('Website : '+post.website),
            Text('Username : '+post.username),
            Text('Street : '+post.street),
          ],
        ),
      )
    );
  }
}
