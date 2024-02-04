part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSucsessNew extends HomeState {

  final List<CustomMessgesModel> messages;

  HomeSucsessNew({required this.messages});
}
final class HomeSucsessSpical extends HomeState {

  final List<CustomMessgesModel> messages;

  HomeSucsessSpical({required this.messages});
}

final class HomeSucsess extends HomeState {
  
  final List<CategorissModel> categories;

  HomeSucsess({ required this.categories});
}
