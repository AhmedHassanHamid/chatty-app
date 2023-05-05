import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/pages/frame/sign_in/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../common/routes/names.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(String type) async{
    try {
      if (type == "phone number") {
        print("...you are logging in with a phone number ..");
      } else if (type == "google") {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";
          LoginRequestEntity loginPanellRequestEntity =  LoginRequestEntity();
          loginPanellRequestEntity.avatar = photoUrl;
          loginPanellRequestEntity.name = displayName;
          loginPanellRequestEntity.email = email;
          loginPanellRequestEntity.open_id = id;
          loginPanellRequestEntity.type= 2;
          asyncPostAllData();
        }
      } else {
        print("...login type not sure ..");
      }
    } catch (e) {
      print('...error with login $e');
    }
  }

  asyncPostAllData(){
    Get.offAllNamed(AppRoutes.Message);
  }
}
