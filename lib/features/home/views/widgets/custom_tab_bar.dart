import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: (value) {
         
        },
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelStyle: AppStyls.stylebold22(context),
        indicatorColor: Colors.white,
        tabs: [
          Tab(icon: const Text(''), text: 'catergorisess'.tr()),
          Tab(icon: const Text(''), text: 'new'.tr()),
          Tab(icon: const Text(''), text: 'special'.tr()),
          Tab(icon: const Text(''), text: 'faviorte'.tr()),
        ]);
  }
}
