import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/error_text.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
import 'package:khwater/features/home/view_model/new_messages_cuibt/new_messages_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class NewITems extends StatelessWidget {
  const NewITems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewMessagesCubit(MessagesRepoIm())..getNewMessages(),
      child: BlocBuilder<NewMessagesCubit, NewMessagesState>(
        builder: (context, state) {
          if (state is NewMessagesSucsess) {
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: CustomItems(
                    index: 1,
                    messages: state.messages[index],
                  ));
            }, childCount: state.messages.length));
          } else if (state is NewMessagesFailure) {
            return CustomTextError(errorMessage: state.errorMessage);
          } else {
            return const SliverToBoxAdapter(
              child: CustomAddLoading(),
            );
          }
        },
      ),
    );

    //  SliverList.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) {

    // },
    // );
  }
}
