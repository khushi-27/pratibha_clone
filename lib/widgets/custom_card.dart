import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageName;
  final String text;
  const CustomCard({
    Key? key,
    required this.imageName,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 125,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageName,
                width: 30.0,
                height: 30.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[900], fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    );
  }
}
