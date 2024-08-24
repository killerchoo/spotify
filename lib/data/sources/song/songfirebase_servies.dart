import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/model/song/song.dart';
import 'package:spotify/domain/entities/song/song.dart';

// Define the Fail class to use with Either
class Fail {
  final String message;
  Fail(this.message);
}

abstract class SongFirebaseService {
  Future<Either<Fail, List<SongEnitity>>> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either<Fail, List<SongEnitity>>> getNewsSongs() async {
    try {
      List<SongEnitity> songs = [];
      var data = await FirebaseFirestore.instance.collection("songs").orderBy("title", descending: true).limit(3).get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(songModel.toEnitity());

        // Print each song's data to the console
        print('Fetched Song: ${element.data()}');
      }

      return Right(songs);
    } catch (e) {
      return Left(Fail("An Error Occurred: ${e.toString()}"));
    }
  }
}
