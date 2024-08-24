import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_song.dart';
import 'package:spotify/presentation/home/bloc/news_song_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongCubit extends Cubit<NewSongState> {

  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSongs() async {

    var returnedSongs = await sL < GetNewsSongUseCase > ().call();
    returnedSongs.fold(
            (l) {
          emit(NewsSongLoadedFailure("NO DATA"));
        },
            (data) {
              print('Fetched Songs: $data');
          emit(
              NewsSongLoaded(songs: data)
          );
        }
    );
  }
}
