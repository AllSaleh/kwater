import 'package:flutter/material.dart';
import 'package:khwater/core/styls.dart';

class CustomDrwerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  const CustomDrwerListTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyls.styleSemiBold25(context),
      ),
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
