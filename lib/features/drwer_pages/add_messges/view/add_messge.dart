import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/drwer_pages/add_messges/data/add_repo/add_repo_im.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/add_messge_body_view.dart';

import 'package:khwater/features/drwer_pages/add_messges/view_model/add_message/add_items_cubit.dart';

class AddMessges extends StatelessWidget {
  const AddMessges({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddItemsCubit(AddRepoIm(dioHelper: DioHelper()))..getCaterorisess(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: const AddMessgeBodyView(),
      ),
    );
  }
}
