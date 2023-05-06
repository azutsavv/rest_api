import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class pic_upload extends StatefulWidget {
  const pic_upload({super.key});
  static const routename = '/pic_upload';

  @override
  State<pic_upload> createState() => _pic_uploadState();
}

class _pic_uploadState extends State<pic_upload> {
  File? image;
  final _picker = ImagePicker();
  bool showspinner = false;

  Future getimage() async {
    final pickedfile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (PickedFile != null) {
      image = File(pickedfile!.path);
      setState(() {});
    } else {
      print('No Image Selected');
    }
  }

  Future<Divider> uploadImage() async {
    setState(() {
      showspinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse('https://fakestoreapi.com/products');

    var request = new http.MultipartRequest('POST', uri);

    request.fields['title'] = 'Static title';

    var multiport = new http.MultipartFile('image', stream, length);

    request.files.add(multiport);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        showspinner = false;
      });

      print('Image Uploaded');
    } else {
      print('Image Not Uploaded');

      setState(() {
        showspinner = false;
      });
    }

    return Divider();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Upload Picture'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: getimage,
                child: Container(
                    child: image == null
                        ? Center(child: Text('Pick Image'))
                        : Container(
                            child: Center(
                              child: Image.file(
                                File(image!.path).absolute,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
              )
            
            ,
            SizedBox(
              height: 150,
            ),
            GestureDetector(
              onTap: uploadImage,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                color: Colors.amber,
                child: Text('Upload Image'),
              ),
            )
           
            ],
          )),
    );
  }
}
