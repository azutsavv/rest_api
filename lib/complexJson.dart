import 'dart:convert';
import 'package:coivd_tracker_api/models/complex_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class complexJson extends StatefulWidget {
  const complexJson({super.key});
  static const routename = '/complexJson';
  @override
  State<complexJson> createState() => _complexJsonState();
}

class _complexJsonState extends State<complexJson> {
  List<UserModel> usermodel1 = [];

  Future<List<UserModel>> usermodel() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']);
        usermodel1.add(UserModel.fromJson(i as dynamic));
      }
      return usermodel1;
    } else {
      return usermodel1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('complex api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: usermodel(),
                  builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                        height: 40,
                        child:  CircularProgressIndicator(),
                      ));
                    } else {
                      return ListView.builder(
                          itemCount: usermodel1.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: [
                                        rowmode(
                                          title: 'NAME', 
                                          value: snapshot.data![index].name.toString()),
                                        rowmode(
                                          title: 'E-MAIL', 
                                          value: snapshot.data![index].email.toString()),
                                        rowmode(
                                          title: 'Phone', 
                                          value: snapshot.data![index].phone.toString()),
                                        rowmode(
                                          title: 'ADDRESS', 
                                          value: snapshot.data![index].address.toString()),
                                        rowmode(
                                          title: 'latitude', 
                                          value: snapshot.data![index].address!.geo!.lat.toString()),
                                        rowmode(
                                          title: 'Longitude', 
                                          value: snapshot.data![index].address!.geo!.lng.toString()),
                                        
                                      ],
                                    )
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }

  
}

class rowmode extends StatelessWidget {
  String title , value;
rowmode({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(title),
      Text(value)
     
  ],);
  }
}
