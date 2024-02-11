import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:khwater/main/bloc_providers.dart';
import 'package:khwater/main/custom_localization.dart';
import 'package:khwater/main/material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

late SharedPreferences sharedPrefe;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPrefe = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(CustomLocalization(
    child: Khwater(),
  ));
}

class Khwater extends StatelessWidget {
  const Khwater({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviders(
      child: Child(),
    );
  }
}
