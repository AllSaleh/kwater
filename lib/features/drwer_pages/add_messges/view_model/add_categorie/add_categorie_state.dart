part of 'add_categorie_cubit.dart';

@immutable
sealed class AddCategorieState {}

final class AddCategorieInitial extends AddCategorieState {}
final class AddCategorieLoading extends AddCategorieState {}
final class AddCategorieFailure extends AddCategorieState 
{
  final String errorMessage;

  AddCategorieFailure({required this.errorMessage});
}
final class AddCategorieNoSelected extends AddCategorieState {}
final class AddCategorieSucsess extends AddCategorieState {}




