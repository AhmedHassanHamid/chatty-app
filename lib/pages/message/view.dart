import 'package:chatty/pages/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/colors.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _hdeadBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.only(bottom: 20.h, top: 30.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.goProfile();
                  },
                  child: Container(
                    width: 50.h,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(22.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: controller.state.head_detail.value.avatar == null
                        ? Image(
                            image:
                                AssetImage("assets/images/account_header.png"),
                          )
                        : Text("hi"),
                  ),
                ),
                Positioned(
                  bottom: 5.w,
                  right: 0.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: AppColors.primaryElementText
                      ),
                      color: AppColors.primaryElementStatus,
                      borderRadius: BorderRadius.all(Radius.circular(12.w))
                    ),
                  ), 
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _hdeadBar(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
