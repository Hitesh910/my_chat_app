import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mychat_app/screen/profile/controller/profile_controller.dart';
import 'package:mychat_app/screen/profile/model/profile_model.dart';

import '../../../utils/helper/db_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future<void> getData()
  async {
    controller.getData();
    if(controller.model!=null) {
      txtName.text = await controller.model!.name!;
      txtEmail.text = await controller.model!.name!;
      txtBio.text = await controller.model!.name!;
      txtMobile.text = await controller.model!.name!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name"),
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  controller: txtName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text("Email"),
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  controller: txtEmail,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text("Bio"),
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  controller: txtBio,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const Text("Mobile no"),
              Padding(
                padding: const EdgeInsets.all(4),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: txtMobile,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    ProfileModel model = ProfileModel(
                        name: txtName.text,
                        email: txtEmail.text,
                        bio: txtBio.text,
                        mobile: txtMobile.text);
                   await FireDbHelper.helper.setProfile(model);
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
