part of 'messages_options_cubit.dart';

@immutable
sealed class MessagesOptionsState {}

final class MessagesOptionsInitial extends MessagesOptionsState {}
final class MessagesOptionsFailure extends MessagesOptionsState 
{
  final String errorMessage;

  MessagesOptionsFailure({required this.errorMessage});
}
final class MessagesOptionsSucsess extends MessagesOptionsState {}


