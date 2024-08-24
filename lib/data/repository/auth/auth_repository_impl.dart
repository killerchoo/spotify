import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/model/auth/create_uesr_req.dart';
import 'package:spotify/data/model/auth/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_serivce.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {
    return await sL<AuthFirebaseService>().signin(signInUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
return await sL<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either<Fail, bool>> isSignedIn() async {
    try {
      bool isSignedIn = FirebaseAuth.instance.currentUser != null;
      return Right(isSignedIn);
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }

}