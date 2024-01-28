import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/drwer_pages/settings/view/widgets/settings_body_view.dart';
import 'package:khwater/features/drwer_pages/settings/view_model/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: const SettingsBodyView(),
      ),
    );
  }
}
