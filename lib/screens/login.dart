import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pratibha_clone/screens/forgot_password.dart';
import 'package:pratibha_clone/screens/registration.dart';
import 'package:pratibha_clone/widgets/custom_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:pratibha_clone/screens/home_page.dart';
import 'package:pratibha_clone/models.dart/user_login_model.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser(String email, String password) async {
    http.Response response = await http.post(
        Uri.parse('https://e-prathibha.com/apis/login'),
        body: {'email': email, 'password': password});

    final String responseString = response.body;

    Map<String, dynamic> decodedData = jsonDecode(response.body);
    if (decodedData['status'] == 200) {
      print('ok');
      return userLoginModelFromJson(responseString);
    } else {
      return null;
    }
  }

  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          width: 304,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0)),
                child: Row(
                  children: [
                    Container(
                      height: 45.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.grey[200]),
                      ),
                    ),
                    Container(
                      height: 45.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
              CustomFormField(
                  text: '* Email',
                  controller: emailController,
                  obscureText: false),
              CustomFormField(
                  text: '* Password',
                  controller: passwordController,
                  obscureText: true),
              const SizedBox(height: 20.0),
              TextButton(
                  onPressed: () async {
                    final String email = emailController.text;
                    final String password = passwordController.text;

                    final UserLoginModel loggedInUser =
                        await loginUser(email, password);

                    if (loggedInUser.status == 200) {
                      setState(() {
                        isValid = true;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(email: email)));
                    } else {
                      setState(() {
                        const Text('Invalid email or password');
                        isValid = false;
                      });
                    }
                  },
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.grey[200], fontSize: 16.0),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()));
                  },
                  child: const Text(
                    "Forget Password ?",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  )),
              const Divider(
                thickness: 1.0,
                color: Colors.grey,
                indent: 40.0,
                endIndent: 40.0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registration()));
                  },
                  child: const Text(
                    "Don't have an account ? Register yourself",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
