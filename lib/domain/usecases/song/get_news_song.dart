import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repository/song/song.dart';

class GetNewsSongUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async {
  return await sL<SongRepository>().getNewsSongs();
  }

}