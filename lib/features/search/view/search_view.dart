import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/search/view/widgets/custom_textfield.dart';
import 'package:khwater/features/search/view/widgets/search_body_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kPrimaryColor,
        title: const CsutomSearchTextField(),
      ),
      body: const SearchBodyView(),
    );
  }
}
