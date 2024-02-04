import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/home/views/widgets/custom_tab_bar.dart';

class AppBarContiner extends StatelessWidget {
  const AppBarContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: const DefaultTabController(
            length: 4, child: Center(child: CustomTabBar())));
  }
}
