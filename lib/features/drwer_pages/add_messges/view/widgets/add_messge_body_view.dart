import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/add_messge_text_filed.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_elevated_button.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/drop_button_textfiled.dart';

class AddMessgeBodyView extends StatelessWidget {
  const AddMessgeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          Text('categoris'.tr(), style: AppStyls.stylebold22(context)),
          const SizedBox(height: 18),
          const CustomDropButtonFiled(),
          const SizedBox(height: 20),
          Text('contint'.tr(), style: AppStyls.stylebold22(context)),
          const SizedBox(height: 18),
          const AddMessgeTextFiled(),
          const SizedBox(height: 30),
          CustomElevatedButton(title: 'add'.tr(), onTap: () {})
        ],
      ),
    );
  }
}
