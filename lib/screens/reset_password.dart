import 'package:flutter/material.dart';
import 'package:pratibha_clone/screens/login.dart';
import 'package:pratibha_clone/widgets/custom_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/icons/final.png'),
              const SizedBox(height: 100.0),
              Text('Reset Password',
                  style: TextStyle(color: Colors.grey[700], fontSize: 25.0)),
              const SizedBox(height: 12.0),
              CustomFormField(
                  text: 'New Password',
                  controller: newPasswordController,
                  obscureText: true),
              CustomFormField(
                  text: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: true),
              const SizedBox(height: 25.0),
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Text(
                        'Submit',
                        style:
                            TextStyle(color: Colors.grey[200], fontSize: 18.0),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
