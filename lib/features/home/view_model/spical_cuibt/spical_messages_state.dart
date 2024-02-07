part of 'spical_messages_cubit.dart';

@immutable
sealed class SpicalMessagesState {}

final class SpicalMessagesInitial extends SpicalMessagesState {}
final class SpicalMessagesFailure extends SpicalMessagesState
 {
  final String errorMessage;

  SpicalMessagesFailure({required this.errorMessage});
 }
final class SpicalMessagesISucsess extends SpicalMessagesState
 {
  final List<CustomMessgesModel> messages;

  SpicalMessagesISucsess({required this.messages});
 }

