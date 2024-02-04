import 'package:flutter/material.dart';
import 'package:khwater/core/constans/colors.dart';

class CustomItemIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomItemIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: kPrimaryColor,
      ),
    );
  }
}
