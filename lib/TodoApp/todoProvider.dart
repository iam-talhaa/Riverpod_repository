import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_pract/TodoApp/ItemModel.dart';

final ItemProvider = StateNotifierProvider<ItemNotifier, List<todoItems>>((
  ref,
) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<todoItems>> {
  ItemNotifier() : super([]) {}
  void AddItem(String name, String Descriptions) {
    final items = todoItems(
      description: Descriptions,
      id: DateTime.now().millisecond.toString(),
      name: name,
    );

    state.add(items);
    state = state.toList();
  }

  void DeleteItme(String id) {
    state.removeWhere((item) => item.id == id);
    state = state.toList();
  }
  void Updateitem(String id) {
    state.indexWhere((item) => item.id == id);

    state = state.toList();
  }
}
