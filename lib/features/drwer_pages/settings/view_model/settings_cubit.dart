import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool notification = true;
  bool updateMessages = true;

  void editNotification({required bool notification1}) {
    notification = notification1;

    emit(SettingsInitial());
  }

  void editUpdateMessages({required bool updateMessages1}) {
    updateMessages = updateMessages1;
    emit(SettingsInitial());
  }

  void changeTheam() {
    emit(SettingsInitial());
  }
}
