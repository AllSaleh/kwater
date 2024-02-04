import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/search/data/search_repo.dart';
import 'package:khwater/features/search/view/widgets/custom_textfield.dart';
import 'package:khwater/features/search/view/widgets/search_body_view.dart';
import 'package:khwater/features/search/view_model/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepIm()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: kPrimaryColor,
          title: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return CsutomSearchTextField(
                onTap: () {
                  BlocProvider.of<SearchCubit>(context).searchMessage();
                  
                },
                controller:BlocProvider.of<SearchCubit>(context).messge ,
                onFieldSubmitted: (val) {
                  BlocProvider.of<SearchCubit>(context).searchMessage();

                  
                },
                autofocus: true,
              );
            },
          ),
        ),
        body: const SearchBodyView(),
      ),
    );
  }
}
