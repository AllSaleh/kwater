import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomLocalization extends StatelessWidget {
  final Widget child;
  const CustomLocalization({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
        path: 'assets/translations',
        startLocale: const Locale('ar'),
        supportedLocales: const [Locale('ar'), Locale('en')],
        child: child
        
        );
  }
}
