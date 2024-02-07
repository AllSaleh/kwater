import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/is_light.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/main.dart';

class ModeContiner extends StatelessWidget {
  const ModeContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      icon: Container(
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
                title: Text('light'.tr(), style: AppStyls.stylebold22(context)),
                activeColor: kPrimaryColor,
                value: 1,
                groupValue: isLight() ? 1 : 0,
                onChanged: (val) {
                  sharedPrefe.setString('theam', 'light');

                  BlocProvider.of<LocalizationCubit>(context).appTheamData();
                  context.pop();
                }),
            RadioListTile(
                title: Text('dark'.tr(), style: AppStyls.stylebold22(context)),
                activeColor: kPrimaryColor,
                value: 2,
                groupValue: isLight() ? 0 : 2,
                onChanged: (val) {
                  sharedPrefe.setString('theam', 'dark');

                  BlocProvider.of<LocalizationCubit>(context).appTheamData();
                  context.pop();
                })
          ],
        ),
      ),
    );
  }
}
