import 'package:flutter/material.dart';
import 'package:khwater/features/home/views/widgets/custom_items.dart';

class Faviorte extends StatelessWidget {
  const Faviorte({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: 
            Text('data')
            // CustomItems()
            
            );
      },
    );
  }
}
