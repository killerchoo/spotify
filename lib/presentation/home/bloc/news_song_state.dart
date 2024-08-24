import '../../../domain/entities/song/song.dart';

abstract class NewSongState {}

class NewsSongLoading extends NewSongState{

}
class NewsSongLoaded extends NewSongState{
  final List<SongEnitity> songs;
  NewsSongLoaded({required this.songs});

}
class NewsSongLoadedFailure extends NewSongState {
  final String error;
  NewsSongLoadedFailure(this.error);
}