// ignore_for_file: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart' show Notifier, NotifierProvider;
import '../models/item.dart';

class SelectedItemsNotifier extends Notifier<Set<Item>> {
  @override
  Set<Item> build() => {};

  void toggle(Item item) {
    if (state.contains(item)) {
      state = {...state}..remove(item);
    } else {
      state = {...state, item};
    }
  }

  void clear() => state = {};

  bool isSelected(Item item) => state.contains(item);

  bool get isSelecting => state.isNotEmpty;
}

final selectedItemsProvider =
    NotifierProvider<SelectedItemsNotifier, Set<Item>>(() => SelectedItemsNotifier());
