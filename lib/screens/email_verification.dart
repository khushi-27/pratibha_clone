import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pratibha_clone/widgets/custom_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:pratibha_clone/screens/login.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  TextEditingController codeController = TextEditingController();

  Future verifyEmail(String emailCode) async {
    http.Response response = await http.post(
        Uri.parse('https://e-prathibha.com/apis/verifyEmail'),
        body: {'reg_code': emailCode});
    Map<String, dynamic> random = jsonDecode(response.body);

    return random['status'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomFormField(
            text: 'Enter Code',
            controller: codeController,
            obscureText: false,
          ),
          const SizedBox(height: 30),
          Container(
            height: 50,
            width: 120,
            color: Colors.black,
            child: TextButton(
              onPressed: () async {
                final String emailCode = codeController.text;
                var status = await verifyEmail(emailCode);

                if (status == 200) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                } else {
                  const Text(
                    'Email not verified',
                    style: TextStyle(color: Colors.black),
                  );
                }
              },
              child: Text('Verify',
                  style: TextStyle(color: Colors.grey[200], fontSize: 20.0)),
            ),
          )
        ],
      )),
    );
  }
}
