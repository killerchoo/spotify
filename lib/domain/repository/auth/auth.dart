import 'package:dartz/dartz.dart';
import 'package:spotify/data/model/auth/create_uesr_req.dart';
import 'package:spotify/data/model/auth/signin_user_req.dart';

abstract class AuthRepository{

  Future<Either> signup(CreateUserReq createUserReq);


  Future<Either> signin(SignInUserReq signInUserReq);

  Future<Either<Fail,bool>> isSignedIn();


}