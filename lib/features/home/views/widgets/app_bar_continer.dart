import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/views/widgets/custom_tab_bar.dart';

class AppBarContiner extends StatelessWidget {
  const AppBarContiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        child: DefaultTabController(
          length: 4,
          child: Column(children: [
            // Spacer(),
            const SizedBox(height: 30),
            Text(
              ',,,خواطر مبعثره',
              style: AppStyls.styleregular40(context),
            ),
            // Spacer(),
            const CustomTabBar(),
            // Spacer()

            // Expanded(flex: 1, child: SizedBox())
          ]),
        ));
  }
}
