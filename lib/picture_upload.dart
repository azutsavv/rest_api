import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class pic_upload extends StatefulWidget {
  const pic_upload({super.key});
  static const routename = '/pic_upload';

  @override
  State<pic_upload> createState() => _pic_uploadState();
}

class _pic_uploadState extends State<pic_upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Picture'),
    ),
    body : Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container()
      ],
    )
    );
  }
}