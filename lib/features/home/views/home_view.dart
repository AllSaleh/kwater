import 'package:flutter/material.dart';
import 'package:khwater/features/home/views/widgets/custom_drwer.dart';
import 'package:khwater/features/home/views/widgets/home_body_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: CustomDrwer(),
      body: SafeArea(
        child: HomeBodyView(),
      ),
    );
  }
}
