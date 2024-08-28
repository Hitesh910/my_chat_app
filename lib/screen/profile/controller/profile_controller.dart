import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mychat_app/screen/profile/model/profile_model.dart';
import 'package:mychat_app/utils/helper/db_helper.dart';

class ProfileController extends GetxController
{
  ProfileModel? model;

  Future<void> getData()
  async {
    model = await FireDbHelper.helper.getProfile();
  }
}