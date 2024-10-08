import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/is_darkmode.dart';
import 'package:spotify/common/widget/app_bar/app_bar.dart';
import 'package:spotify/common/widget/button/basic_app_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/page/signin.dart';
import 'package:spotify/presentation/auth/page/signup.dart';

import '../../../core/configs/theme/app_colors.dart';

class SignUpOrSigninPage extends StatelessWidget {
  const SignUpOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 55,
                  ),
                  const Text(
                    "Enjoy Listening To Music",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: AppColors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                            BasicAppButton(onpress: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage(),),);
                            }, title: "Register"),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage(), ),);
                      }, child: Text("Sign In",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: context.isDarkMode ? Colors.white : Colors.black
                      ),),),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
