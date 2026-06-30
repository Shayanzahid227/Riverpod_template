import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_practice/todo_app/todo_model.dart';

final favouriteStateProvider =
    StateNotifierProvider<FavouriteViewModel, FavouriteState>((ref) {
      return FavouriteViewModel();
    });

class FavouriteViewModel extends StateNotifier<FavouriteState> {
  FavouriteViewModel()
    // initial state of the favourite screen
    : super(FavouriteState(searchWord: '', favouriteItems: [], allItems: []));

  void addItem() {
    List<Item> items = [
      Item(id: '1', name: 'Item 1', isFavourite: false),
      Item(id: '2', name: 'Item 2', isFavourite: true),
      Item(id: '3', name: 'Item 3', isFavourite: false),
      Item(id: '4', name: 'Item 4', isFavourite: true),
      Item(id: '5', name: 'Item 5', isFavourite: false),
      Item(id: '6', name: 'Item 6', isFavourite: true),
    ];

    state = state.copyWith(allItems: items.toList(),favouriteItems: items.toList());
     
  }

  ///
  ///. search function to search among all the items
  ///
  void searchItems(String keyword) {
    state = state.copyWith(searchWord: keyword);
  }

}
 
///
///. staets to which will deal during the favourite screen
///
class FavouriteState {
  final String searchWord; // for searching among al items
  final List<Item>
  favouriteItems; //on pressing the favourite button it will add the item to this list
  final List<Item> allItems; // all items

  FavouriteState({
    required this.searchWord,
    required this.favouriteItems,
    required this.allItems,
  });

  FavouriteState copyWith({
    String? searchWord,
    List<Item>? favouriteItems,
    List<Item>? allItems,
  }) {
    return FavouriteState(
      searchWord: searchWord ?? this.searchWord,
      favouriteItems: favouriteItems ?? this.favouriteItems,
      allItems: allItems ?? this.allItems,
    );
  }
}
