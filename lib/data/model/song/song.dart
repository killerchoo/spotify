import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releseDate;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.releseDate});

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data["duration"];
    releseDate = data['relese date'];
  }
}

extension SongModelX on SongModel {
  SongEnitity toEnitity() {
    return SongEnitity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releseDate: releseDate!);
  }
}
