import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

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
                groupValue: 1,
                onChanged: (val) {}),
            RadioListTile(
                title: Text('dark'.tr(), style: AppStyls.stylebold22(context)),
                activeColor: kPrimaryColor,
                value: 2,
                groupValue: 1,
                onChanged: (val) {})
          ],
        ),
      ),
    );
  }
}
