import 'package:flutter/material.dart';
import 'package:mychat_app/utils/services/notification_services.dart';

import '../../../utils/helper/auth_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(onPressed: () {
            NotificationServices.notificationServices.showSimpleNotification();
          }, icon:  Icon(Icons.notification_add)),
          IconButton(onPressed: ()
          async{
          await  NotificationServices.notificationServices.showSchewdualNotification();
          }, icon: Icon(Icons.timer))
        ],
      ),
      body: const Center(
        child: Text("Welcome to HomePage"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_drop_down),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              label: const Text("Profile"),
              icon: const Icon(Icons.person),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/login');
                await AuthHelper.helper.singOut();
                AuthHelper.helper.checkUser();
              },
              child: const Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
