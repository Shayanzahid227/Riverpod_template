import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_practice/todo_app/todo_model.dart';
final itemViewModelProvider= StateNotifierProvider<ItemViewModel, List<Item>>((ref) {
  return ItemViewModel();
});
class ItemViewModel extends StateNotifier<List<Item>> {
  ItemViewModel() : super([]);

  ///
  ///. add item to the list
  ///
void addItemToList(String name){
  final item = Item(id: DateTime.now().toIso8601String(), name: name);
  state.add(item);
  state = state.toList();
}
///
/// delete item from the list
///
void deleteItemFromList(String id){
  state.removeWhere((item) => item.id == id);
  state = state.toList();
  
}///
  /// update item in the list
  ///
  void updateItemInList(String id, String name){
    final index = state.indexWhere((item) => item.id == id);
    if (index != -1) {
      state[index] = state[index].copyWith(name: name);
      state = state.toList();
    }
  }}