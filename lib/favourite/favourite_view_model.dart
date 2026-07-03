import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_practice/todo_app/todo_model.dart';

final favouriteStateProvider =
    StateNotifierProvider<FavouriteViewModel, FavouriteState>((ref) {
      return FavouriteViewModel();
    });

class FavouriteViewModel extends StateNotifier<FavouriteState> {
  FavouriteViewModel()
    // initial state of the favourite screen
    : super(FavouriteState(searchWord: '', filterItems: [], allItems: []));

  void addItem() {
    List<Item> items = [
      Item(id: '1', name: 'shayan', isFavourite: false),
      Item(id: '2', name: 'zahid', isFavourite: true),
      Item(id: '3', name: 'mardan', isFavourite: false),
      Item(id: '4', name: 'BC CS', isFavourite: true),
      Item(id: '5', name: '6 feet', isFavourite: false),
      Item(id: '6', name: 'App developer', isFavourite: true),
    ];

    state = state.copyWith(allItems: items.toList(),filteredItems: items.toList());
     
  }

  ///
  ///. search function to search among all the items
  ///
  void searchItems(String searchWord) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, searchWord));
  }
List<Item> _filterItems(List<Item> items, String searchWord) {
    if (searchWord.isEmpty) {
      return items;
    } else {
      return items
          .where((item) => item.name.toLowerCase().contains(searchWord.toLowerCase()))
          .toList();
    }
  }
}
 
///
///. staets to which will deal during the favourite screen
///
class FavouriteState {
  final String searchWord; // for searching among al items
  final List<Item>
  filterItems; //on pressing the favourite button it will add the item to this list
  final List<Item> allItems; // all items

  FavouriteState({
    required this.searchWord,
    required this.filterItems,
    required this.allItems,
  });

  FavouriteState copyWith({
    String? searchWord,
    List<Item>? filteredItems,
    List<Item>? allItems,
  }) {
    return FavouriteState(
      searchWord: searchWord ?? this.searchWord,
      filterItems: filteredItems ?? this.filterItems,
      allItems: allItems ?? this.allItems,
    );
  }
}
