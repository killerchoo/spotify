import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/intro/get_started.dart';
import 'package:spotify/service_locator.dart';

import '../../../domain/usecases/auth/checklogin.dart';
import '../../home/pages/home.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    redirect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),

      ),
    );
  }
  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    final result = await sL<CheckLoginStatusUseCase>().call();
    bool isLoggedIn = false;

    result.fold(
          (failure) {
        // Handle failure here
        print("Error: $failure");
      },
          (status) {
        // Handle success here
        isLoggedIn = status;
      },
    );

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GetStarted()),
      );
    }
  }



}

