part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchNodata extends SearchState 
{
  final String errorMessage;

  SearchNodata({required this.errorMessage});
}
final class SearchSucsess extends SearchState 
{
  final List<CustomMessgesModel> messages;

  SearchSucsess({required this.messages});
}
final class SearchLoading extends SearchState {}



