import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/custom_snack_bar.dart';
import 'package:khwater/core/routers/routers_names.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/view_model/updating_cuibt/updating_cubit.dart';

import 'package:khwater/features/home/views/widgets/change_lan_continer.dart';
import 'package:khwater/features/home/views/widgets/custom_drwer_list_tile.dart';

class CustomDrwer extends StatelessWidget {
  const CustomDrwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPrimaryColor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(
            'خواطر مبعثره',
            style: AppStyls.styleregular40(context),
          ),
          const Divider(),
          const Spacer(),
          CustomDrwerListTile(
              title: 'addMessage'.tr(),
              onTap: () {
                GoRouter.of(context).pushNamed(Routers.addmessges);
                Scaffold.of(context).closeDrawer();
              },
              icon: FontAwesomeIcons.plus),
          CustomDrwerListTile(
              title: 'addCategorie'.tr(),
              onTap: () {
                GoRouter.of(context).pushNamed(Routers.addCategorie);
                Scaffold.of(context).closeDrawer();
              },
              icon: FontAwesomeIcons.plus),
          CustomDrwerListTile(
              title: 'settings'.tr(),
              onTap: () {
                GoRouter.of(context).pushNamed(Routers.settings);
                Scaffold.of(context).closeDrawer();
              },
              icon: FontAwesomeIcons.gear),
          BlocListener<UpdatingCubit, UpdatingState>(
            listener: (context, state) {
              if (state is UpdatingSucsess) {
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(context, title: state.sucessMessage));
                BlocProvider.of<HomeCubit>(context).getHomeFunction();
              } else if (state is UpdatingFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(context, title: state.errorMessage));
              }
            },
            child: CustomDrwerListTile(
                title: 'udate'.tr(),
                onTap: () {
                  BlocProvider.of<UpdatingCubit>(context).getOnlineData();
                  Scaffold.of(context).closeDrawer();
                },
                icon: Icons.refresh),
          ),
          CustomDrwerListTile(
              title: 'changeLan'.tr(),
              onTap: () {
                Scaffold.of(context).closeDrawer();
                showDialog(
                    context: context,
                    builder: (_) {
                      return const ChangeLanguageContiner();
                    });
              },
              icon: Icons.language_outlined),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
