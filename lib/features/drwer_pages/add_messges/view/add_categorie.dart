import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/api/dio_helper.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/drwer_pages/add_messges/data/add_repo/add_repo_im.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/add_categories_body_view.dart';
import 'package:khwater/features/drwer_pages/add_messges/view_model/add_categorie/add_categorie_cubit.dart';

class AddCategorie extends StatelessWidget {
  const AddCategorie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategorieCubit(AddRepoIm(dioHelper: DioHelper())),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: const AddCategoriesBodyView(),
      ),
    );
  }
}
