import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sm/Scanner/QrScanner.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;
  void signOutUser() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan an item your choice"),
      ),
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrReader(),
                  fullscreenDialog: true,
                ),
              );
            },
            icon: const Icon(Icons.scanner_rounded),
            label: const Text("Scan Now")),
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text("Sm"),
                accountEmail: Text("Email"),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: signOutUser,
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app_rounded),
                title: const Text("Quit App"),
                onTap: () => exit(0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
