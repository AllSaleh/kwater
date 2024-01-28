import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/app_images.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/routers/routers_names.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).pushReplacementNamed(Routers.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesLogo),
          const SizedBox(height: 80),
          Lottie.asset('assets/lotties/loading.json', height: 80),
        ],
      ),
    );
  }
}
