part of 'add_items_cubit.dart';

sealed class AddItemsState {}

final class AddItemsInitial extends AddItemsState {}
final class AddItemsLoading extends AddItemsState {}

final class AddItemsSucsess extends AddItemsState {}
final class AddItemsNoCategorie extends AddItemsState
 {
  final String errorMessage;

  AddItemsNoCategorie({required this.errorMessage});
 }

final class AddItemsAddeddSucsess extends AddItemsState {}
final class AddItemsFailure extends AddItemsState
 {

  final String errorMessage;

  AddItemsFailure({required this.errorMessage});
 }



