import 'package:cloud_firestore/cloud_firestore.dart';

class SongEnitity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releseDate;

  SongEnitity(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releseDate});
}
