import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/routers/routers_names.dart';
import 'package:khwater/features/home/views/widgets/app_bar_continer.dart';
import 'package:khwater/features/home/views/widgets/categorisess_gird.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).pushNamed(Routers.search);
                },
                icon: const Icon(Icons.search))
          ],
          backgroundColor: Colors.white,
          expandedHeight: MediaQuery.sizeOf(context).height * .2,
          flexibleSpace: const FlexibleSpaceBar(
            background: AppBarContiner(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        // const CustomItemsListBuilder(),
        const CategorisessGrid(),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
