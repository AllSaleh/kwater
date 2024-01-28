import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';

class ChangeLanguageContiner extends StatelessWidget {
  const ChangeLanguageContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconPadding: EdgeInsets.zero,
      // contentPadding: EdgeInsets.zero,
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
                groupValue: 1,
                onChanged: (val) {}),
            RadioListTile(
                title: Text('الانجليزية', style: AppStyls.stylebold22(context)),
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
