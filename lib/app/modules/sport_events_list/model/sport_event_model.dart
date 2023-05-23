import 'package:flutter/material.dart';

class SportsEventModel {
  final int id;
   String title;
   String? description;
   String? location;
   String maxCountOfPlayers;
   DateTime date;
   TimeOfDay? time;
   String? imagePath;

  SportsEventModel({
    required this.id,
    this.location,
    this.imagePath,
    required this.title,
    this.description,
    required this.maxCountOfPlayers,
    this.time,
    required this.date,
  });
}
