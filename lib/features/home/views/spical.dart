import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class Special extends StatelessWidget {
  const Special({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSucsessSpical) {
       return   SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomItems(messages: state.messages[index]));
          }, childCount: state.messages.length));
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
    );

    // SliverList.builder(
    //   itemCount: 10,
    //   itemBuilder: (BuildContext context, int index) {

    //         //  CustomItems());
    //   },
    // );
  }
}
