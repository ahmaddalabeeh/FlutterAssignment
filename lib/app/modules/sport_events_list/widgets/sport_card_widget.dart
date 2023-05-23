import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SportEventCard extends StatelessWidget {
  final String title;
  final String? description;
  final DateTime date;
  final TimeOfDay? time;
  final String? imagePath;
  final String? location;
  final Function()? onDeletePressed;
  final Function()? onEditPressed;
  final void Function()? onTap;

  final String maxCountOfPlayers;
  const SportEventCard(
      {super.key,
      required this.title,
      this.description,
      required this.date,
      this.imagePath,
      required this.maxCountOfPlayers,
      this.location,
      this.onDeletePressed,
      this.onEditPressed,
      this.onTap,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 5,
      child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'title'.tr,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        title,
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'description'.tr,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        description ?? '',
                        maxLines: 3,
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'location'.tr,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        location ?? 'undetermined'.tr,
                        style: Get.textTheme.bodyLarge
                            ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'date'.tr,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      DateFormat('EEE, M/d/y').format(date).toString(),
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'time'.tr,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      TimeOfDay(hour: time!.hour, minute: time!.minute)
                          .format(context)
                          .toString(),
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                    ),
                    // child: Text(
                    //   time ?? 'undetermined'.tr,
                    //
                    // ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'maxPlayerCount'.tr,
                    style: Get.textTheme.bodyMedium
                        ?.copyWith(color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      maxCountOfPlayers.toString(),
                      style: Get.textTheme.bodyLarge
                          ?.copyWith(color: Colors.blue.withOpacity(0.5)),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: onDeletePressed,
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: onEditPressed,
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                      InkWell(
                          onTap: onTap,
                          child: SvgPicture.asset(
                            'assets/icons/whatsapp.svg',
                            width: 20,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  imagePath == ''
                      ? const CircleAvatar(
                          radius: 85,
                          backgroundImage: NetworkImage(
                              'https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg'),
                        )
                      : CircleAvatar(
                          radius: 85,
                          backgroundImage: FileImage(File(imagePath ?? ''))),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
