import 'package:get/get.dart';

import '../../../utils/helper/db_helper.dart';

class ChatController extends GetxController {
  Stream? sp;

  void readData() {
    sp = FireDbHelper.helper.getReadData();
  }
}
