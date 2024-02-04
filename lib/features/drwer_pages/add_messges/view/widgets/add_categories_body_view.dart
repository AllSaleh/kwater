import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/functions/custom_snack_bar.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';

import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_categorie_textfiled.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_elevated_button.dart';
import 'package:khwater/features/drwer_pages/add_messges/view_model/add_categorie/add_categorie_cubit.dart';

class AddCategoriesBodyView extends StatelessWidget {
  const AddCategoriesBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Spacer(),
          CustomCategoriTextFiled(
              controller: context.read<AddCategorieCubit>().categorie),
          const SizedBox(
            height: 60,
          ),
          BlocConsumer<AddCategorieCubit, AddCategorieState>(
            listener: (context, state) {
              if (state is AddCategorieFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(context, title: state.errorMessage));
              } else if (state is AddCategorieSucsess) {
                context.read<AddCategorieCubit>().categorie.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(context, title: 'addedd'.tr()));
              }
            },
            builder: (context, state) {
              if (state is AddCategorieLoading) {
                return const CustomAddLoading();
              } else {
                return CustomElevatedButton(
                    title: 'add'.tr(),
                    onTap: () {
                      context.read<AddCategorieCubit>().addCategorie();
                    });
              }
            },
          ),
          const Spacer()
        ],
      ),
    );
  }
}
