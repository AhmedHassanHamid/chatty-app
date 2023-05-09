import 'package:chatty/common/services/services.dart';
import 'package:chatty/common/store/store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'firebase_options.dart';

class Global{
  static Future<void> init() async {
    //EasyLoading.init();
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
  }
}