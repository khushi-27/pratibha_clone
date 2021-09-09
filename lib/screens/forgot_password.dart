import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pratibha_clone/screens/login.dart';
import 'package:pratibha_clone/screens/reset_password.dart';
import 'package:pratibha_clone/widgets/custom_form_field.dart';
import 'package:http/http.dart' as http;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  Future forgotPassword(String email) async {
    http.Response response = await http.post(
      Uri.parse('https://e-prathibha.com/apis/forgetPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Forgot': {"email": email},
      }),
    );

    Map<String, dynamic> decodedData = jsonDecode(response.body);

    return decodedData;
  }

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
      child: isValid
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/icons/final.png'),
                  const SizedBox(height: 150.0),
                  Text('Forgot Password',
                      style:
                          TextStyle(color: Colors.grey[700], fontSize: 25.0)),
                  const SizedBox(height: 12.0),
                  CustomFormField(
                      text: 'Email',
                      controller: emailController,
                      obscureText: true),
                  const SizedBox(height: 15.0),
                  Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: TextButton(
                          onPressed: () async {
                            final String email = emailController.text;

                            var decodedData = await forgotPassword(email);

                            print(decodedData);

                            if (decodedData['status'] == 200) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPassword()));
                              setState(() {
                                isValid = true;
                              });
                            } else {
                              setState(() {
                                isValid = false;
                              });
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.grey[200], fontSize: 18.0),
                          ))),
                  const SizedBox(height: 20.0),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: const Text('Click here to Login',
                          style: TextStyle(fontSize: 20.0))),
                ],
              ),
            )
          : const Center(child: Text('Invalid email')),
    ));
  }
}
