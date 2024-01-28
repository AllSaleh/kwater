import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';

class CustomSettingsListTile extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback? onTap;
  const CustomSettingsListTile(
      {super.key, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppStyls.styleregulard22(context).copyWith(color: Colors.black),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          subtitle,
          style:
              AppStyls.styleregulard22(context).copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
