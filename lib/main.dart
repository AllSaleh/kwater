import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/core/routers/routers.dart';
import 'package:khwater/core/sqlite_helper.dart';
import 'package:khwater/features/home/data/repo/home_repo_im.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';

import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/view_model/messages_options_cuibt/messages_options_cubit.dart';
import 'package:khwater/features/home/view_model/updating_cuibt/updating_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPrefe;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefe = await SharedPreferences.getInstance();
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
    return BlocProviders(
      child: Child(),
    );
  }
}

class BlocProviders extends StatelessWidget {
  final Widget child;
  const BlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessagesOptionsCubit(MessagesRepoIm()),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            HomeRepoIm(dioHelper: DioHelper()),
          )..getHomeFunction(),
        ),
        BlocProvider(
          create: (context) =>
              UpdatingCubit(HomeRepoIm(dioHelper: DioHelper())),
        ),
        BlocProvider(
          create: (context) => LocalizationCubit()..appTheamData(),
        )
      ],
      child: Child(),
    );
  }
}

class Child extends StatelessWidget {
  const Child({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    cheekTheam();
    return BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        SqlHeper sqlHeper = SqlHeper();

        sqlHeper.inizalizeDb();
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: BlocProvider.of<LocalizationCubit>(context).themeData,
          //  ThemeData(
          //     // brightness: Brightness.dark,
          //     fontFamily: 'Tajawal',
          //     iconTheme: const IconThemeData(color: Colors.white),
          //     dividerTheme: const DividerThemeData(color: Colors.white)),
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
}
