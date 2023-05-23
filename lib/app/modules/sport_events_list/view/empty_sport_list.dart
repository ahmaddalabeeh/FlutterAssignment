import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptySportListView extends StatelessWidget {
  const EmptySportListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/emptyList.png",
          ),
          SizedBox(
            height: Get.height * (0.02),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50, left: 50),
            child: Text(
              'emptyList'.tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyLarge?.copyWith(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}