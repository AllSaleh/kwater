import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';
import 'package:khwater/features/search/view_model/search_cubit.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const SliverToBoxAdapter(child: CustomAddLoading());
            } else if (state is SearchSucsess) {
              return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: CustomItems(messages: state.messages[index])
                    //  /CustomItems()
                    );
              }, childCount: state.messages.length));
            } else if (state is SearchNodata) {
              return SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      style: AppStyls.styleregulard20(context),
                    ),
                  ),
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            }
          },
        )
      ],
    );
  }
}
