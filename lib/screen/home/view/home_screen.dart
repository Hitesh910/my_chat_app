import 'package:flutter/material.dart';

import '../../../utils/helper/auth_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Home"),
      actions: [],),
      body: const Center(
        child: Text("Welcome to HomePage"),
      ),
      drawer: Drawer(
        child: Column(
          children: [const Spacer(),ElevatedButton(onPressed: () async {
            Navigator.pushNamed(context, "/login");
          await  AuthHelper.helper.singOut();
          }, child: const Text("Log out"))],
        ),
      ),
    );
  }
}
