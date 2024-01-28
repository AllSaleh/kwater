import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/features/drwer_pages/add_messges/view/widgets/add_messge_body_view.dart';

class AddMessges extends StatelessWidget {
  const AddMessges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: const AddMessgeBodyView(),
    );
  }
}
