part of 'menu_bloc.dart';


abstract class MenuEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectCategoryEvent extends MenuEvent{
  final String category;

  SelectCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}

class SearchMenuEvent extends MenuEvent{
  final String query;

  SearchMenuEvent(this.query);

  @override
  List<Object?> get props => [query];
}

