import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pratibha_clone/widgets/custom_form_field.dart';
import 'package:pratibha_clone/screens/email_verification.dart';
import 'package:pratibha_clone/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:pratibha_clone/models.dart/user_register_model.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();

  Future registerUser(String email, String name, String phone, String password,
      String confirmPassword) async {
    var map = <String, dynamic>{};

    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['password'] = password;
    map['confirmPassword'] = confirmPassword;

    http.Response response = await http
        .post(Uri.parse('https://e-prathibha.com/apis/register'), body: map);

    final String responseString = response.body;
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return userRegisterModelFromJson(responseString);
    } else {
      print("Error occured");
      return null;
    }
  }

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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Container(
                        height: 45.0,
                        width: 150.0,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 45.0,
                      width: 150.0,
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Text(
                        'Register',
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
              CustomFormField(
                text: '* Email',
                controller: emailController,
                obscureText: false,
              ),
              CustomFormField(
                text: '* Name',
                controller: nameController,
                obscureText: false,
              ),
              CustomFormField(
                text: '* Password',
                controller: passwordController,
                obscureText: true,
              ),
              CustomFormField(
                text: '* Re-enter password',
                controller: confirmPasswordController,
                obscureText: true,
              ),
              CustomFormField(
                text: '* Mobile Number',
                controller: phoneController,
                obscureText: false,
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 173,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0))),
                      child: TextFormField(
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0))),
                      child: Text('Choose Photo',
                          style: TextStyle(
                              color: Colors.grey[200], fontSize: 15.0)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Answer simple math: 2+3 = ?',
                style: TextStyle(color: Colors.grey[700], fontSize: 16.0),
              ),
              const SizedBox(height: 15.0),
              CustomFormField(
                text: 'Enter security code shown above',
                controller: securityCodeController,
                obscureText: false,
              ),
              const SizedBox(height: 10.0),
              TextButton(
                  onPressed: () async {
                    final String name = nameController.text;
                    final String email = emailController.text;
                    final String phone = phoneController.text;
                    final String password = passwordController.text;
                    final String confirmPassword =
                        confirmPasswordController.text;

                    final registeredUser = await registerUser(
                        email, name, phone, password, confirmPassword);

                    if (registeredUser.status == 200) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailVerify()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }
                  },
                  child: Container(
                    height: 50.0,
                    width: 110.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_circle_rounded,
                            color: Colors.grey),
                        const SizedBox(width: 5.0),
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.grey[200], fontSize: 16.0),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
