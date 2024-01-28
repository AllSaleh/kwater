import 'package:flutter/material.dart';
import 'package:khwater/features/home/views/widgets/custom_categorises.dart';

class CategorisessGrid extends StatelessWidget {
  const CategorisessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 30,
        mainAxisExtent: 60,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomIcategorises(),
        );
      },
    );
  }
}
