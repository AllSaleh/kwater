import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khwater/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool? notification = sharedPrefe.getBool('notification');
  bool? updateMessages = sharedPrefe.getBool('updating');
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  void editNotification({required bool notification1}) {
    if (notification1 == true) {
      firebaseMessaging.subscribeToTopic('khwater');
      sharedPrefe.setBool('notification', true);
    } else {
      firebaseMessaging.unsubscribeFromTopic('khwater');
      sharedPrefe.setBool('notification', false);

    }

    notification = notification1;

    emit(SettingsInitial());
  }

  void editUpdateMessages({required bool updateMessages1}) {
    sharedPrefe.setBool('updating', updateMessages1);
    updateMessages = updateMessages1;

    emit(SettingsInitial());
  }

  void changeTheam() {
    emit(SettingsInitial());
  }
}
