  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter/material.dart';
  import 'package:spotify/core/configs/constants/app_urls.dart';
  import 'package:spotify/presentation/home/bloc/news_song_cubit.dart';
  import 'package:spotify/presentation/home/bloc/news_song_state.dart';

  import '../../../domain/entities/song/song.dart';
  import '../../../domain/repository/song/song.dart';
  import '../../../service_locator.dart';

  class NewsSongs extends StatelessWidget {
    const NewsSongs({super.key});

    @override
    Widget build(BuildContext context) {
      return BlocProvider(
        create: (_) => NewsSongCubit()..getNewsSongs(),
        child: SizedBox(
            height: 200,
            child: BlocBuilder<NewsSongCubit, NewSongState>(
                builder: (context, state) {
              if (state is NewsSongLoading) {
                print('LOADING');
                print('SongRepository: ${sL.isRegistered<SongRepository>()}');

                return Container(

                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              else if (state is NewsSongLoaded) {
                print('loaded');
                return _songs(state.songs);
              }
              else if ( state is NewsSongLoadedFailure){

                print("ERROR WAS APPAREL");
                print('SongRepository: ${sL.isRegistered<SongRepository>()}');
                return Container(
                  alignment: Alignment.center,
                  child: const Text("SONGS WILL DISPLAY HERE"),
                );

              }
              return Container();
            },),),
      );
    }

    Widget _songs(List<SongEnitity> songs) {
      return ListView.separated(
          itemBuilder: (context, index) {
            return SizedBox(
              width: 160,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('${AppURLs.firestorage}${songs[index].artist}-${songs[index].title}.jpg?${AppURLs.mediaAlt}'),fit: BoxFit.cover),),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 14,
            );
          },
          itemCount: songs.length);
    }
  }
