import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/core/constans/error_text.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/custom_add_loading.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/views/widgets/custom_categorises.dart';

class CategorisessGrid extends StatelessWidget {
  const CategorisessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        if(state is HomeFailure){
          return SliverToBoxAdapter(child: CustomTextError(errorMessage: state.errorMessage));
        }
        else  if (state is HomeSucsess) {
          return SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomIcategorises(
                    categorissModel: state.categories[index],
                  ),
                );
              }, childCount: state.categories.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30,
                mainAxisExtent: 60,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ));
        } else {
          return const SliverToBoxAdapter(child: CustomAddLoading());
        }
      },
    );
  }
}
