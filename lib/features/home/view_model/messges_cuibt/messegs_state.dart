part of 'messegs_cubit.dart';

@immutable
sealed class MessegsState {}

final class MessegsInitial extends MessegsState {}
final class MessegsLoading extends MessegsState {}
final class MessegsFailure extends MessegsState
 {
  final String errorMessage;

  MessegsFailure({required this.errorMessage});
 }



final class MessegsSucsess extends MessegsState {
  final List<CustomMessgesModel> messages;

  MessegsSucsess(this.messages);
}
final class MessegsSucsessSearch extends MessegsState {
  final List<CustomMessgesModel> searchMessages;

  MessegsSucsessSearch({required this.searchMessages});

}
