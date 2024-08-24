import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

class CheckLoginStatusUseCase implements UseCase<bool,NoParams> {
  final AuthRepository authRepository;

  CheckLoginStatusUseCase(this.authRepository);

  @override
  Future<Either<Fail,bool>> call({NoParams? params}) async {
    return await authRepository.isSignedIn();
  }
}

class NoParams {
}
