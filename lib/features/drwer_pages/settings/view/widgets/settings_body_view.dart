import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/drwer_pages/settings/view/widgets/custom_settings_list_tile.dart';
import 'package:khwater/features/drwer_pages/settings/view/widgets/custom_sswich_list_tile.dart';
import 'package:khwater/features/drwer_pages/settings/view/widgets/mode_continer.dart';
import 'package:khwater/features/drwer_pages/settings/view_model/settings_cubit.dart';

class SettingsBodyView extends StatelessWidget {
  const SettingsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.read<SettingsCubit>();
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text('theam'.tr(), style: AppStyls.styleregulard20(context)),
              CustomSettingsListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ModeContiner();
                      },
                    );
                  },
                  title: 'theamMode'.tr(),
                  subtitle: 'light'.tr()),
              Text('updatingSettings'.tr(), style: AppStyls.styleregulard20(context)),
              CustomSwichListTile(
                  value: controller.notification,
                  title: 'enableNotification'.tr(),
                  onChanged: (value) {
                    controller.editNotification(notification1: value);
                  }),
              CustomSwichListTile(
                  value: controller.updateMessages,
                  title: 'updateMessages'.tr(),
                  onChanged: (value) {
                    controller.editUpdateMessages(updateMessages1: value);
                  }),
              Text('aboutApp'.tr(), style: AppStyls.styleregulard20(context)),
               CustomSettingsListTile(
                  title: 'vesoin'.tr(), subtitle: '1.0')
            ],
          ),
        );
      },
    );
  }
}
