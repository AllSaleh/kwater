import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/routers/routers.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/main.dart';

class Child extends StatelessWidget {
  const Child({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    cheekTheam();
    cheekNotification();
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        SqlHeper sqlHeper = SqlHeper();

        sqlHeper.inizalizeDb();
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: BlocProvider.of<LocalizationCubit>(context).themeData,
          routerConfig: AppRouters.routers,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  void cheekTheam() {
    if (sharedPrefe.getString('theam') == null) {
      sharedPrefe.setString('theam', 'light');
    }
  }

  void cheekNotification() async {
    if (sharedPrefe.getBool('notification') == null) {
      await FirebaseMessaging.instance.subscribeToTopic('khwater');
      sharedPrefe.setBool('notification', true);
    }
  }
}
