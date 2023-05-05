import 'package:chatty/pages/profile/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/names.dart';

class ProfileController extends GetxController {
  ProfileController();
  final state = ProfileState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
        Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.Message));
  }
}
