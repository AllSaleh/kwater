import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:khwater/core/constans/colors.dart';
import 'package:khwater/core/routers/routers_names.dart';

import 'package:khwater/core/styls.dart';
import 'package:khwater/features/home/data/model/categoriss_model.dart';

class CustomIcategorises extends StatelessWidget {
  final CategorissModel categorissModel;
  const CustomIcategorises({
    super.key,
    required this.categorissModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GoRouter.of(context).pushNamed(Routers.showCustomItems,
            extra: categorissModel);
      },
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          categorissModel.categorie!,
          style: AppStyls.styleregulard22(context),
        )),
      ),
    );
  }
}
