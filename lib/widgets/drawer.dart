import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratibha_clone/screens/login.dart';

class MyDrawer extends StatelessWidget {
  final String email;

  const MyDrawer({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: Container(
          color: Colors.grey,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: const Text(
                    'User Name',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  accountEmail: Text(
                    email,
                    style: const TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () => {},
                leading: const Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: const Text(
                  "Profile",
                  textScaleFactor: 1.4,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const ListTile(
                leading: Icon(
                  CupertinoIcons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  textScaleFactor: 1.4,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                leading: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: const Text(
                  "Log out",
                  textScaleFactor: 1.4,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
