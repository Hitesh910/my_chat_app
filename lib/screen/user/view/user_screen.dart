import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat_app/screen/user/controller/user_controller.dart';
import 'package:mychat_app/utils/helper/auth_helper.dart';
import 'package:mychat_app/utils/helper/db_helper.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserController controller = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    controller.getUser();
    super.initState();
    // controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.profileList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
 await FireDbHelper.helper.getChatDocId(AuthHelper.helper.user!.uid, controller.profileList[index].uid);
                Get.toNamed(
                  '/chat',
                  arguments: controller.profileList[index],
                );
              },
              title: InkWell(
                onTap: () {
                  // Get.toNamed('/chat');
                },
                child: Text("${controller.profileList[index].name}"),
              ),
              subtitle: Text("${controller.profileList[index].mobile}"),
              leading: CircleAvatar(
                child: Text("${controller.profileList[index].name![0]}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
