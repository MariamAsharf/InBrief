import '../model/newsResponse.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class GetSourceLoadingState extends HomeState {}

class GetSourceSuccesState extends HomeState {}

class GetSourceErrorState extends HomeState {
  String error;

  GetSourceErrorState(this.error);
}

class GetNewsLoadingState extends HomeState {}

class GetNewsSuccesState extends HomeState {}

class GetNewsErrorState extends HomeState {
  String error;

  GetNewsErrorState(this.error);
}

class GetChangeTabState extends HomeState {}

class CategorySelectedState extends HomeState {}

class HomeInitialState extends HomeState {}


class SearchSuccessStates extends HomeState {}

class ShowNewsDetailsState extends HomeState {
  final Articles articles;

  ShowNewsDetailsState(this.articles);
}
