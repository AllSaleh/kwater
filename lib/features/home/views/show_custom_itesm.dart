import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/home/data/model/categoriss_model.dart';
import 'package:khwater/features/home/data/repo/messges_rep.dart';
import 'package:khwater/features/home/view_model/messges_cuibt/messegs_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';
import 'package:khwater/features/search/view/widgets/custom_textfield.dart';

class ShowCustomItems extends StatelessWidget {
  final CategorissModel categorissModel;
  const ShowCustomItems({
    super.key,
    required this.categorissModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessegsCubit(MessagesRepoIm())
        ..getCustomMessages(
            id: categorissModel.categoriesId!.toInt(),
            cat: categorissModel.categorie!),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: kPrimaryColor,
          title: BlocBuilder<MessegsCubit, MessegsState>(
            builder: (context, state) {
              return CsutomSearchTextField(
                controller: BlocProvider.of<MessegsCubit>(context).message,
                onFieldSubmitted: (p0) {
                  BlocProvider.of<MessegsCubit>(context).getSearchMessges();
                },
                onTap: () {
                  BlocProvider.of<MessegsCubit>(context).getSearchMessges();
                },
              );
            },
          ),
        ),
        body: BlocBuilder<MessegsCubit, MessegsState>(
          builder: (context, state) {
            if (state is MessegsSucsess) {
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: CustomItems(
                          messages: state.messages[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            } else if (state is MessegsSucsessSearch) {
              return CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemCount: state.searchMessages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: CustomItems(
                          messages: state.searchMessages[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
