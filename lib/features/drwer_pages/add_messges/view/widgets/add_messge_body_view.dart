import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/functions/custom_snack_bar.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/add_messge_text_filed.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_elevated_button.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/drop_button_textfiled.dart';

import 'package:khwater/features/drwer_pages/add_messges/view_model/add_message/add_items_cubit.dart';

class AddMessgeBodyView extends StatelessWidget {
  const AddMessgeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
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
            AddMessgeTextFiled(
              controller: context.read<AddItemsCubit>().message,
            ),
            const SizedBox(height: 30),
            BlocConsumer<AddItemsCubit, AddItemsState>(
              listener: (context, state) {
                if (state is AddItemsNoCategorie) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: state.errorMessage));
                } else if (state is AddItemsAddeddSucsess) {
                  context.read<AddItemsCubit>().message.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: 'addedd'.tr()));
                } else if (state is AddItemsFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(context, title: state.errorMessage));
                }
              },
              builder: (context, state) {
                if (state is AddItemsLoading) {
                  return const CustomAddLoading();
                } else {
                  return CustomElevatedButton(
                      title: 'add'.tr(),
                      onTap: () {
                        context.read<AddItemsCubit>().addMessage();
                      });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
