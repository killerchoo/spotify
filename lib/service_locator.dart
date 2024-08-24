import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_serivce.dart';
import 'package:spotify/data/sources/song/songfirebase_servies.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/checklogin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/get_news_song.dart';

import 'data/repository/song/song.dart';

import 'domain/repository/song/song.dart';
import 'domain/usecases/auth/signin.dart';

final sL = GetIt.instance;
Future<void>initializeDependencies() async{

  sL.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sL.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );

  sL.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );


  sL.registerSingleton<SignUpUseCase>(
    SignUpUseCase()
  );

  sL.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );


  sL.registerSingleton<GetNewsSongUseCase>(
      GetNewsSongUseCase()
  );
  sL.registerSingleton<SongRepository>(
    SongRepositoryImpl()
  );


  sL.registerSingleton<CheckLoginStatusUseCase>(
    CheckLoginStatusUseCase(sL<AuthRepository>()),
  );
}