import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/routers/routers_names.dart';
import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/view_model/home_cubit.dart';
import 'package:khwater/features/home/views/widgets/app_bar_continer.dart';

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({super.key});

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: controller,
          slivers: [
            SliverAppBar(
              toolbarHeight: 80,
              centerTitle: true,
              title: Text(
                'خواطر مبعثره',
                style: AppStyls.styleregular40(context),
              ),
              pinned: true,
              actions: [
                IconButton(
                    onPressed: () {
                     
                      GoRouter.of(context).pushNamed(Routers.search);
                    },
                    icon: const Icon(Icons.search))
              ],
              backgroundColor: kPrimaryColor,
              expandedHeight: 150,
              flexibleSpace: const FlexibleSpaceBar(
                background: AppBarContiner(),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            
            context.read<HomeCubit>().pages[context.read<HomeCubit>().index],
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
          ],
        );
      },
    );
  }
}
