import 'dart:convert';

import 'package:chatty/common/apis/apis.dart';
import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/common/store/store.dart';
import 'package:chatty/common/utils/http.dart';
import 'package:chatty/common/widgets/toast.dart';
import 'package:chatty/pages/frame/sign_in/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        final GoogleSignInAuthentication gAuth = await user!.authentication;
        final _credential = GoogleAuthProvider.credential(
          idToken: gAuth.idToken,
          accessToken: gAuth.accessToken,
        );
        await FirebaseAuth.instance.signInWithCredential(_credential);
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
          print(jsonEncode(loginPanellRequestEntity));
          asyncPostAllData(loginPanellRequestEntity);
        }
      } else {
        print("...login type not sure ..");
      }
    } catch (e) {
      print('...error with login $e');
    }
  }

  asyncPostAllData(LoginRequestEntity loginPanellRequestEntity) async{
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.Login(params: loginPanellRequestEntity);
    if (result.code==0) {
      await UserStore.to.saveProfile(result.data!);
      EasyLoading.dismiss();
    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "Internet error");

    }
    Get.offAllNamed(AppRoutes.Message);
  }
}
