import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/routers/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      child: const Khwater()));
}

class Khwater extends StatelessWidget {
  const Khwater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
          fontFamily: 'Tajawal',
          iconTheme: const IconThemeData(color: Colors.white),
          dividerTheme: const DividerThemeData(color: Colors.white)),
      routerConfig: AppRouters.routers,
      debugShowCheckedModeBanner: false,
    );
  }
}
