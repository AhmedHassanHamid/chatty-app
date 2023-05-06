import 'package:chatty/common/store/store.dart';
import 'package:chatty/pages/profile/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class ProfileController extends GetxController {
  ProfileController();
  final state = ProfileState();


  void goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
