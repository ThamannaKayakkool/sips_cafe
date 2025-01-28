import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sips_cafe/src/core/config/constants.dart';
import 'package:sips_cafe/src/core/utils/typedefs.dart';

part 'menu_event.dart';

part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final List<Map<String, dynamic>> menuAllItem;

  MenuBloc({required this.menuAllItem})
      : super(MenuState(
          selectedCategory: 'All Menu',
          searchQuery: '',
          filteredMenu: menuAllItem,
          categories: _extractCategories(menuAllItem),
        )) {
    on<SelectCategoryEvent>(_selectCategoryHandler);
    on<SearchMenuEvent>(_searchMenuHandler);
  }

  void _selectCategoryHandler(
      SelectCategoryEvent event, Emitter<MenuState> emit) async {
    final filteredMenu = event.category == 'All Menu'
        ? menuAllItem
        : menuAllItem
            .where((item) => item['category'] == event.category)
            .toList();
    emit(state.copyWith(
      selectedCategory: event.category,
      filteredMenu: filteredMenu,
    ));
  }

  void _searchMenuHandler(
      SearchMenuEvent event, Emitter<MenuState> emit) async {
    final filteredMenu = state.selectedCategory == 'All Menu'
        ? menuAllItem
        : menuAllItem
            .where((item) => item['category'] == state.selectedCategory)
            .toList();

    final searchedMenu = filteredMenu
        .where((item) => item['name']
            .toString()
            .toLowerCase()
            .contains(event.query.toLowerCase()))
        .toList();
    emit(state.copyWith(
      searchQuery: event.query,
      filteredMenu: searchedMenu,
    ));
  }

  static List<String> _extractCategories(
      List<Map<String, dynamic>> menuAllItem) {
    final categories =
        menuAllItem.map((item) => item['category']).toSet().toList();
    categories.insert(0, 'All Menu');
    return category;
  }
}
