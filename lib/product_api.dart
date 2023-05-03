import 'dart:convert';

import 'package:coivd_tracker_api/models/final_get_complex_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  static const routename = '/product';
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Future<ProductModel> getproduct() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/022b7873-4e62-4697-b3cf-48969f82f683'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final_complex_api'),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<ProductModel>(
                  future: getproduct(),
                  builder: (context, Snapshot) {
                    if (!Snapshot.hasData) {
                      return Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 40,
                            child: CircularProgressIndicator(),
                          ));
                    } else {
                      return ListView.builder(
                          itemCount: Snapshot.data!.data!.length,
                          itemBuilder: (context, Index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Text(Snapshot.data!.data![Index].shop!.name.toString()),
                                  subtitle: Text(Snapshot.data!.data![Index].shop!.shopemail.toString()),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(Snapshot.data!.data![Index].shop!.image.toString()),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 1,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Snapshot.data!.data![Index].images!.length,
                                      itemBuilder: (context, position) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        
                                       height:
                                        MediaQuery.of(context).size.height * 0.25,
                                                                      width:
                                        MediaQuery.of(context).size.width * 0.5, 
                                       
                                       decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),


                                      image: DecorationImage(
                                        image: NetworkImage(Snapshot.data!.data![Index].images![position].url.toString()),
                                        fit: BoxFit.cover
                                        )
                                        
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            );
                          });
                    }
                  }))
        ],
      ),
    );
  }
}
