part of 'updating_cubit.dart';

@immutable
sealed class UpdatingState {}

final class UpdatingInitial extends UpdatingState {}
final class UpdatingFailure extends UpdatingState 
{
  final String errorMessage;

  UpdatingFailure({required this.errorMessage});
}
final class UpdatingSucsess extends UpdatingState 
{
  final String sucessMessage;

  UpdatingSucsess({required this.sucessMessage});
}


