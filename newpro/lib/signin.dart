import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newpro/login.dart';
import 'package:http/http.dart' as http;

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Future<void> registerAdopter(String name, String phone, String email,
      String password, String address, String state, String user) async {
    const url =
        'http://campus.sicsglobal.co.in/Project/farmers_Market/api/user_registration.php';

    Map<String, String> body = {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
      'state': state,
      'user_type': user
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
                'Registration Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (namecontroller.text.isEmpty) {
                      return "please enter ur name";
                    } else {
                      return null;
                    }
                  },
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Name",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (phonecontroller.text.isEmpty) {
                      return "please enter ur ph no";
                    } else {
                      return null;
                    }
                  },
                  controller: phonecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.mail),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Ph.no",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (emailcontroller.text.isEmpty) {
                      return "please enter ur email";
                    } else {
                      return null;
                    }
                  },
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: " email",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (passwordcontroller.text.isEmpty) {
                      return "please enter ur password";
                    } else {
                      return null;
                    }
                  },
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.remove_red_eye),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "password",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (addresscontroller.text.isEmpty) {
                      return "please enter ur address";
                    } else {
                      return null;
                    }
                  },
                  controller: addresscontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.call),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "address",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: (value) {
                    if (statecontroller.text.isEmpty) {
                      return "please enter ur state";
                    } else {
                      return null;
                    }
                  },
                  controller: statecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.call),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "state",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                TextFormField(
                  validator: (value) {
                    if (usercontroller.text.isEmpty) {
                      return "please enter ur user";
                    } else {
                      return null;
                    }
                  },
                  controller: usercontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(90),
                      ),
                      prefixIcon: Icon(Icons.call),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color.fromARGB(255, 51, 25, 25)),
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "state",
                      prefixIconColor: const Color.fromARGB(255, 35, 22, 22),
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 44, 23, 23))),
                ),
                ElevatedButton(
                    onPressed: () {
                      registerAdopter(
                          namecontroller.text.toString(),
                          phonecontroller.text.toString(),
                          emailcontroller.text.toString(),
                          passwordcontroller.text.toString(),
                          addresscontroller.text.toString(),
                          statecontroller.text.toString(),
                          usercontroller.text.toString());
                    },
                    child: Text("sign up"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
