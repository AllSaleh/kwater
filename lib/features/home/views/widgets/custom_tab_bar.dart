import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        return TabBar(
            isScrollable: true,
            onTap: (value) {
              BlocProvider.of<HomeCubit>(context).chanePage(index: value);
              BlocProvider.of<HomeCubit>(context).changeIndex(newIndex: value);
            },
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelStyle:
                AppStyls.styleregulard20(context).copyWith(color: Colors.white),
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: const Text(''), text: 'catergorisess'.tr()),
              Tab(icon: const Text(''), text: 'new'.tr()),
              Tab(icon: const Text(''), text: 'special'.tr()),
              Tab(icon: const Text(''), text: 'faviorte'.tr()),
            ]);
      },
    );
  }
}
