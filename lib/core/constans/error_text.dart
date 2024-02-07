import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';


class CustomTextError extends StatelessWidget {
  final String errorMessage;
  const CustomTextError({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyls.styleregulard20(context),
      ),
    );
  }
}
