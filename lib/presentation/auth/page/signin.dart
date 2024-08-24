import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widget/app_bar/app_bar.dart';
import 'package:spotify/data/model/auth/signin_user_req.dart';
import 'package:spotify/presentation/auth/page/signup.dart';

import '../../../common/widget/button/basic_app_button.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../domain/usecases/auth/signin.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignInPage extends StatefulWidget {


   SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo,height: 40,width: 40,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: 50,),
              _emailField(context),
              const SizedBox(height: 30,),
              _passwordField(context),
              const SizedBox(height: 30,),
              BasicAppButton(onpress: () async{
                var result = await sL<SignInUseCase>().call(
                  params: SignInUserReq(
                      email: _email.text.toString(),
                      password: _password.text.toString()),
                );
                result.fold((l) {
                  var snackbar = SnackBar(content: Text(l));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }, (r) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                          (route) => false);
                });
              }, title: "Sign In"),

            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      obscureText: _isPasswordObscured,

      decoration:  InputDecoration(
          hintText: 'Password ',suffixIcon: IconButton(onPressed: (){
            setState(() {
              _isPasswordObscured = ! _isPasswordObscured;
            });
      }, icon: Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility))
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage(),
                    )
                );
              },
              child: const Text(
                  'Register Now'
              )
          )
        ],
      ),
    );
  }
}
