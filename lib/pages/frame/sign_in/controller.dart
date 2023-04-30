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
        await _googleSignIn.signIn();
      } else {
        print("...login type not sure ..");
      }
    } catch (e) {
      print('...error with login $e');
    }
  }
}
