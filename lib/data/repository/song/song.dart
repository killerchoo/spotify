

import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/songfirebase_servies.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';



class SongRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSongs()async {
    return await sL<SongFirebaseService>().getNewsSongs();

  }

}