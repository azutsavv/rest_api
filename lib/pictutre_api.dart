import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:coivd_tracker_api/models/user_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'models/picture_api_model.dart';

class picture_api extends StatefulWidget {
  const picture_api({super.key});
  @override
  static const routename = '/picture_api';
  State<picture_api> createState() => _picture_apiState();
}

class _picture_apiState extends State<picture_api> {
  List<picture> picturelist = [];

  Future<List<picture>> getpictures() async {
    final Response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map i in data) {
        picture pic = picture(i['title'], i['url'] , i['id']);
        picturelist.add(pic);
      }
      return picturelist;
    } else {
      return picturelist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Picture Api'),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getpictures(),
                builder: ((context, AsyncSnapshot<List<picture>> snapshot) {
                return ListView.builder(
                  itemCount: picturelist.length,
                  itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index].url.toString()),
                    ),
                    title: Text(snapshot.data![index].title.toString()),
                    subtitle: Text(snapshot.data![index].id.toString()),
                  );
                });
              })),
            )
          ],
        ));
  }
}
