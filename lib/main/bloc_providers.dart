import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/localization/localization_cubit.dart';
import 'package:khwater/features/home/data/repo/home_repo_im.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/view_model/messages_options_cuibt/messages_options_cubit.dart';
import 'package:khwater/features/home/view_model/updating_cuibt/updating_cubit.dart';
import 'package:khwater/main/material_app.dart';

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