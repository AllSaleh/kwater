import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/error_text.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
import 'package:khwater/features/home/view_model/faviort_cuibt/faviorte_messages_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class Faviorte extends StatelessWidget {
  const Faviorte({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FaviorteMessagesCubit(MessagesRepoIm())..getFaviorte(),
      child: BlocBuilder<FaviorteMessagesCubit, FaviorteMessagesState>(
        builder: (context, state) {
          if (state is FaviorteMessagesFailure) {
            return SliverToBoxAdapter(
                child: CustomTextError(errorMessage: state.errorMessage));
          } else if (state is FaviorteMessagesGetSucsess) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child:
                        CustomItems(messages: state.messages[index], index: 3)
                    // CustomItems()

                    );
              }, childCount: state.messages.length),
            );
          } else {
            return const SliverToBoxAdapter(child: CustomAddLoading());
          }
        },
      ),
    );
  }
}
