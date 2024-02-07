import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/constans/error_text.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
import 'package:khwater/features/home/view_model/spical_cuibt/spical_messages_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class Special extends StatelessWidget {
  const Special({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpicalMessagesCubit(MessagesRepoIm())..getSpical(),
      child: BlocBuilder<SpicalMessagesCubit, SpicalMessagesState>(
        builder: (context, state) {
          if (state is SpicalMessagesISucsess) {
            return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child:
                      CustomItems(index: 2, messages: state.messages[index]));
            }, childCount: state.messages.length));
          } else if (state is SpicalMessagesFailure) {
            return CustomTextError(errorMessage: state.errorMessage);
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            );
          }
        },
      ),
    );

  }
}
