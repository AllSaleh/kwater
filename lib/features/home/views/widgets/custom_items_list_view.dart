import 'package:flutter/material.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class CustomItemsListBuilder extends StatelessWidget {
  const CustomItemsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text('data')
          
          // CustomItems(),
        );
      },
    );
  }
}
