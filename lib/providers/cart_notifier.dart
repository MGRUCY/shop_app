import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/item.dart';

class CartNotifier extends Notifier<Set<Item>> {
  //init val
  @override
  Set<Item> build() => {};

  //method to update
  void addItem(Item item) {
    if (!state.contains(item)) {
      state = {...state, item};
    }
  }

  void removeItem(Item item) {
    if (state.contains(item)) {
      state = state.where((i) => i.id != item.id).toSet();
    }
  }
}

final cartNotifierProvider =
    NotifierProvider<CartNotifier, Set<Item>>(() => CartNotifier());
