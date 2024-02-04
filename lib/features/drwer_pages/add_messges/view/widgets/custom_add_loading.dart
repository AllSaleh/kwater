import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAddLoading extends StatelessWidget {
  const CustomAddLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset('assets/lotties/loading4.json', height: 120));
  }
}
