part of 'new_messages_cubit.dart';

@immutable
sealed class NewMessagesState {}

final class NewMessagesInitial extends NewMessagesState {}
final class NewMessagesFailure extends NewMessagesState 
{
  final String errorMessage;

  NewMessagesFailure({required this.errorMessage});
}
final class NewMessagesSucsess extends NewMessagesState 
{
  final List<CustomMessgesModel> messages;

  NewMessagesSucsess({required this.messages});
}


