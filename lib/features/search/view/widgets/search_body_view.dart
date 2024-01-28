import 'package:flutter/material.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomItems());
          },
        )
      ],
    );
  }
}
