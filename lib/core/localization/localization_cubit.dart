import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:khwater/core/functions/is_arabic.dart';
import 'package:khwater/core/theam.dart';
import 'package:khwater/main.dart';
part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  ThemeData themeData = ThemeData();

  void changeLocale(BuildContext context) {
    if (isArabick(context)) {
      context.setLocale(const Locale('en'));
      emit(LocalizationInitial());
    } else {
      context.setLocale(const Locale('ar'));

      emit(LocalizationInitial());
    }
  }

  void appTheamData() {
    if (sharedPrefe.getString('theam') == 'light') {
      themeData = AppTheamData.lightMode;
    } else {
      themeData = AppTheamData.darkMode;
    }
    emit(LocalizationInitial());
  }
}
