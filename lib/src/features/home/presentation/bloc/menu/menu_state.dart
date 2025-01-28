part of 'menu_bloc.dart';

class MenuState extends Equatable {
  final String selectedCategory;
  final String searchQuery;
  final List<DataMap> filteredMenu;
  final List<String> categories;
  final int gridCount;

  const MenuState({
    required this.selectedCategory,
    required this.searchQuery,
    required this.filteredMenu,
    required this.categories,
    this.gridCount = 4,
  });

  MenuState copyWith({
    String? selectedCategory,
    String? searchQuery,
    List<DataMap>? filteredMenu,
    List<String>? categories,
    int? gridCount,
  }) {
    return MenuState(
        selectedCategory: selectedCategory ?? this.selectedCategory,
        searchQuery: searchQuery ?? this.searchQuery,
        filteredMenu: filteredMenu ?? this.filteredMenu,
        categories: categories ?? this.categories,
    gridCount: gridCount ?? this.gridCount);
  }

  @override
  List<Object?> get props =>
      [selectedCategory, searchQuery, filteredMenu, categories,gridCount];
}
