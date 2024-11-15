import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newpro/signin.dart';
import 'package:http/http.dart' as http;
import 'package:newpro/time.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<void> Adopter( String phone,
      String password, ) async {
    const url =
        'http://campus.sicsglobal.co.in/Project/Local_farmers_Market/api/user_login.php';

    Map<String, String> body = {
      'phone': phone,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.purple,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  Time()));
          print(body);
          print("Response body${response.body}");
        }
        print(body);
        print("Response body${response.body}");
        print('Registration successful');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              'Already email and password Exists',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 4),
          ),
        );
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              validator: (value) {
                if (phonecontroller.text.isEmpty) {
                  return "please enter your ph no";
                } else {
                  return null;
                }
              },
              controller: phonecontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 39, 14, 14)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter ph no",
                  prefixIconColor: const Color.fromARGB(255, 48, 18, 18),
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 41, 15, 15))),
            ),
            TextFormField(
              validator: (value) {
                if (passwordcontroller.text.isEmpty) {
                  return "please enter your password";
                } else {
                  return null;
                }
              },
              controller: passwordcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 51, 25, 25)),
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "Enter password",
                  prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 44, 23, 23))),
            ),
            ElevatedButton(
                onPressed: () {
             
                    Adopter(
                      phonecontroller.text.toString(),
                      passwordcontroller.text.toString()
                    );
                  
                },
                child: Text("login")),
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage(),));
                    }, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
