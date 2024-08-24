import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/model/auth/create_uesr_req.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SignInUserReq signInUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SignInUserReq signInUserReq) async {

    try {
      await  FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserReq.email, password: signInUserReq.password);
      return const Right("SignIn was SuccessFul");
    } on FirebaseAuthException catch (e) {
      String massage = "";
      if(e.code == "Invalid Email"){
        massage  = "Not User Found for this Email";
      }else if (e.code == "Invalid credential"){
        massage = "Invalid Password";
      }


      return left(massage);

    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
   var data =  await  FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserReq.email, password: createUserReq.password);

         FirebaseFirestore.instance.collection("User").add( {
         "name" : createUserReq.fullname,
         "email" : data.user?.email,
         });
    return const Right("SignUp was SuccessFul");
    } on FirebaseAuthException catch (e) {
      String massage = "";
      if(e.code == "weak password"){
        massage  = "The password Provided too weak";
      }else if (e.code == "email-already-in-use"){
        massage = "An Account already exists with that email";
      }


      return left(massage);

    }
  }
}
