import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/routers/routers.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/repo/home_repo_im.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      child: const Khwater()));
}

class Khwater extends StatelessWidget {
  const Khwater({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
              HomeRepoIm(dioHelper: DioHelper()), InternetConnectionChecker())
            ..getMessages(),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit(),
        )
      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          SqlHeper sqlHeper = SqlHeper();
          sqlHeper.inizalizeDb();
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
                // brightness: Brightness.dark,
                fontFamily: 'Tajawal',
                iconTheme: const IconThemeData(color: Colors.white),
                dividerTheme: const DividerThemeData(color: Colors.white)),
            routerConfig: AppRouters.routers,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
