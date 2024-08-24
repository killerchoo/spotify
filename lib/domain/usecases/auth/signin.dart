import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/model/auth/signin_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignInUseCase implements UseCase<Either,SignInUserReq>{
  @override
  Future<Either> call({SignInUserReq? params}) async {
    return sL<AuthRepository>().signin(params!);
  }
}