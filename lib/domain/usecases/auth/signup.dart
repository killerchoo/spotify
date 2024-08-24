import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/model/auth/create_uesr_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sL<AuthRepository>().signup(params!);
  }
}