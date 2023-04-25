import 'dart:convert';
import 'package:coivd_tracker_api/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class homepage extends StatefulWidget {
  const homepage({super.key});
  static const routename = '/homepage';
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<users> postlist = [];
  Future<List<users>> getpostapi() async {
    final Response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map i in data) {
        postlist.add(users.fromJson(i as dynamic));
      }
      return postlist;
    } else {
      return postlist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API\'s '),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostapi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('');
                  } else {
                    return ListView.builder(
                        itemCount: postlist.length,
                        itemBuilder: (context, index) {
                          return Text(index.toString());
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
