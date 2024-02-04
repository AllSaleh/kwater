import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/drwer_pages/add_messges/view_model/add_message/add_items_cubit.dart';

class CustomDropButtonFiled extends StatelessWidget {
  const CustomDropButtonFiled({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = BlocProvider.of<AddItemsCubit>(context);
    return BlocBuilder<AddItemsCubit, AddItemsState>(
      builder: (context, state) {
        return DropdownButtonFormField(
            hint: Text('chooseCategorie'.tr()),
            // value: controller.id?.toInt(),
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: border(),
                enabledBorder: border(),
                focusedBorder: border()),
            items: [
              ...List.generate(
                  controller.categories.length,
                  (index) => DropdownMenuItem(
                      value: index,
                      child: Text(
                        controller.categories[index].categorie!,
                        style: AppStyls.stylebold22(context)
                            .copyWith(color: kPrimaryColor),
                      )))
            ],
            onChanged: (val) {
              controller.id = controller.categories[val!].categoriesId;
           
            });
      },
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: kPrimaryColor));
  }
}
