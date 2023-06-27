import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/pages/message/chat/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../common/values/colors.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      title: Obx(() {
        return Container(
          child: Text(
            "${controller.state.to_name}",
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: TextStyle(
              fontFamily: "Avenir",
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
              fontSize: 16.sp,
            ),
          ),
        );
      }),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 20.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                child: CachedNetworkImage(
                  imageUrl: controller.state.to_avatar.value,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.w),
                      image: DecorationImage(
                        image: imageProvider,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Image(
                      image: AssetImage("assets/images/account_header.png")),
                ),
              ),
              Positioned(
                bottom: 5.w,
                right: 0.w,
                height: 14.w,
                child: Container(
                  height: 14.w,
                  width: 14.w,
                  decoration: BoxDecoration(
                    color: controller.state.to_online.value == "1"
                        ? AppColors.primaryElementStatus
                        : AppColors.primarySecondaryElementText,
                    borderRadius: BorderRadius.circular(12.w),
                    border: Border.all(
                      width: 2.w,
                      color: AppColors.primaryElementText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                child: Row(
                  children: [
                    Container(
                      width: 270.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        color: AppColors.primaryBackground,
                        border: Border.all(
                          color: AppColors.primarySecondaryElementText,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 220.w,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}