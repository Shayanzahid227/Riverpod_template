import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_practice/todo_app/todo_model.dart';

final itemViewModelProvider = StateNotifierProvider<ItemViewModel, List<Item>>((
  ref,
) {
  return ItemViewModel();
});

class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  ///
  /// Add an item to the list if the `name` is unique.
  /// Returns `true` when added, `false` when a duplicate name exists.
  ///
  bool addItemToList(String itemName) {
    // trim use for to remove empty spaces
    final trimmed = itemName.trim();
    if (trimmed.isEmpty) return false;

    ///
    // Enforce uniqueness (case-insensitive)
    // it check is their is any item in the list that has the same name (case-insensitive) as the new item being added.
    ///
    final exists = state.any(
      (stateItem) => stateItem.name.toLowerCase() == trimmed.toLowerCase(),
    );
    if (exists) return false;

    final item = Item(id: DateTime.now().toIso8601String(), name: trimmed, isFavourite: false);
    // final item = Item(id: DateTime.now().toIso8601String(), name: name);
    state.add(item);
    state = state.toList(); // notify Riverpod about the change
    return true;
  }

  ///
  /// delete item from the list
  ///
  void deleteItemFromList(String id) {
    state.removeWhere((stateItem) {
      return stateItem.id == id;
    });
    state = state.toList();
  }

  ///
  /// update item in the list
  ///
  void updateItemInList(String id, String name) {
    final index = state.indexWhere((stateItem) => stateItem.id == id);
    if (index != -1) {
      state[index] = state[index].copyWith(name: name);
      state = state.toList();
    }

    ///
    ///
    ///
  }
}
 