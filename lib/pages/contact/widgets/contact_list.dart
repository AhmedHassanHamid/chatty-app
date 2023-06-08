import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/contact/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/entities/contact.dart';

class ContactList extends GetView<ContactController> {
  const ContactList({super.key});

  Widget _buildListItem(ContactItem item) {
    return Container(
      padding: EdgeInsets.only(top: 10.h,),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: AppColors.primarySecondaryBackground,
          ),
        ),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: AppColors.primarySecondaryBackground,
            ),
            child: CachedNetworkImage(
              imageUrl: item.avatar!,
              height: 44.w,
              width: 44.w,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(22.w)),
                  image: DecorationImage(image: imageProvider)
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 20.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = controller.state.contactList[index];
                  print(item.name!+'///////////////////////////');
                  return _buildListItem(item);
                },
                childCount: controller.state.contactList.length,
              ),
            ),
          ),
        ],
      );
    });
  }
}
