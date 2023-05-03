import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SIgnup extends StatefulWidget {
  const SIgnup({super.key});

  static const routename = '/SIgnup';
  @override
  State<SIgnup> createState() => _SIgnupState();
}

class _SIgnupState extends State<SIgnup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    void auth(String email, String password) async {
      try {
        Response response =
            await post(Uri.parse('https://reqres.in/api/register'), body: {
          'email': email,
          'password': password,
        });

        if (response.statusCode == 200) {
          print('Account Created Successfully');
        } else {
          print('Account Not Created');
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailcontroler,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'xyz@gmail.com',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordcontroller,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'zxcy1234',
              border: OutlineInputBorder(),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: auth(emailcontroler.toString(), passwordcontroller.toString()),
              child: Text('Sign Up'))
        ],
      ),
    );
  }
}