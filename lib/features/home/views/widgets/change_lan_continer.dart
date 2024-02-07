import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/functions/is_arabic.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/styls.dart';

class ChangeLanguageContiner extends StatelessWidget {
  const ChangeLanguageContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      // contentPadding: EdgeInsets.zero
      insetPadding: EdgeInsets.zero,
      icon: Container(
        // width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
                title: Text('العربيه', style: AppStyls.stylebold22(context)),
                activeColor: kPrimaryColor,
                value: 1,
                groupValue: isArabick(context) ? 1 : 0,
                onChanged: (val) {
                  context.read<LocalizationCubit>().changeLocale(context);
                  context.pop();
                }),
            RadioListTile(
                title: Text('English', style: AppStyls.stylebold22(context)),
                activeColor: kPrimaryColor,
                value: 2,
                groupValue: isArabick(context) ? 0 : 2,
                onChanged: (val) {
                  context.read<LocalizationCubit>().changeLocale(context);
                  context.pop();
                })
          ],
        ),
      ),
    );
  }
}
