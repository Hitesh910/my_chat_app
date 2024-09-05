import 'package:get/get.dart';

import '../../../utils/helper/db_helper.dart';
import '../../profile/model/profile_model.dart';

class UserController extends GetxController
{
  RxList<ProfileModel> profileList = <ProfileModel>[].obs;

  Future<void> getUser()
  async {
    profileList.value =await FireDbHelper.helper.getUsers();
  }
}