part of 'faviorte_messages_cubit.dart';

@immutable
sealed class FaviorteMessagesState {}

final class FaviorteMessagesInitial extends FaviorteMessagesState {}
final class FaviorteMessagesLoading extends FaviorteMessagesState {}
final class FaviorteMessagesGetSucsess extends FaviorteMessagesState 
{
  final List<CustomMessgesModel> messages;

  FaviorteMessagesGetSucsess({required this.messages});
}


final class FaviorteMessagesFailure extends FaviorteMessagesState
 {
  final String errorMessage;

  FaviorteMessagesFailure({required this.errorMessage});
 }

