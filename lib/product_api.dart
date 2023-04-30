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
          Expanded(child:
          FutureBuilder(
            future: getproduct(),
            builder: (context,Snapshot) {
            return ListView.builder(
              itemCount: Snapshot.data!.data!.length,
              itemBuilder: (context, Index) {
              
                
                

                

            });
          }))
        ],
      ),
    );
  }
}
